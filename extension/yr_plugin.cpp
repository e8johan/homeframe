#include "yr_plugin.h"
#include "yrrequest.h"

#include <qqml.h>

void YrPlugin::registerTypes(const char *uri)
{
    qmlRegisterType<YrRequest>(uri, 0, 1, "YrRequest");
}
