#pragma once

#include <QNetworkAccessManager>
#include <QObject>

class YrRequest : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(YrRequest)
    Q_PROPERTY(QString response READ response NOTIFY responseChanged)
    Q_PROPERTY(bool valid READ isValid NOTIFY isValidChanged)

public:
    explicit YrRequest(QObject *parent = nullptr);

    Q_INVOKABLE void get(const QString &url);

    const QString &response() const;
    bool isValid() const;

protected slots:
    void setResponse(const QString &newResponse);
    void setValid(bool newValid);
    void slotFinished();

signals:
    void responseChanged(const QString &response);
    void isValidChanged(bool);

private:
    QNetworkAccessManager *m_manager = nullptr;
    QString m_response;
    bool m_isValid;
};
