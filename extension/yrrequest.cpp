#include "yrrequest.h"

#include <QNetworkReply>

YrRequest::YrRequest(QObject *parent)
    : QObject(parent)
{
    m_manager = new QNetworkAccessManager(this);
}

void YrRequest::get(const QString &url)
{
    auto _request = QScopedPointer<QNetworkRequest>(new QNetworkRequest());
    _request->setUrl(url);
    _request->setTransferTimeout(5000);
    _request->setRawHeader("User-Agent", "HomeFrame/0.1 github.com/e8johan/homeframe");

    QNetworkReply *reply = m_manager->get(*_request);
    QObject::connect(reply, &QNetworkReply::finished, this, &YrRequest::slotFinished);
}

const QString &YrRequest::response() const { return m_response; }
bool YrRequest::isValid() const { return m_isValid; }

void YrRequest::setResponse(const QString &newResponse)
{
    if (m_response == newResponse)
        return;

    m_response = newResponse;
    emit responseChanged(m_response);
}

void YrRequest::setValid(bool newValid)
{
    if (m_isValid == newValid)
        return;

    m_isValid = newValid;
    emit isValidChanged(m_isValid);
}

void YrRequest::slotFinished()
{
    QNetworkReply *reply = dynamic_cast<QNetworkReply*>(sender());
    if (reply != nullptr) {
        // TODO what about invalid statuses
        setResponse(reply->readAll());
        reply->deleteLater();
    }
}
