#include <QDateTime>
#include <QFontMetrics>
#include <QGraphicsObject>
#include <QTimer>

#include "qmlgateway.h"

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
