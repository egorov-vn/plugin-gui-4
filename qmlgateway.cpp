#include <QDateTime>
#include <QFontMetrics>
#include <QGraphicsObject>
#include <QTimer>

#include "qmlgateway.h"

#include "sbispluginconnector.h"

CallbackTypeFunc func;

QmlGateway::QmlGateway(QObject *parent) :
        QObject(parent)
{
}

QmlGateway::~QmlGateway()
{
}

int QmlGateway::textWidth(const QFont &font, const QString &text) const
{
    return QFontMetrics(font).width(text);
}

void QmlGateway::beginAuth()
{
   char *buf = new char[BUF_SIZE];
   GetPlugin("plugin", func, buf, TIME_TO_WAIT, "0.0.0.1", 0);
}
