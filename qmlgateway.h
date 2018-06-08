#ifndef QMLGATEWAY_H_
#define QMLGATEWAY_H_

#include <QObject>
#include <QDeclarativeView>

//#include "localclient.h"

class QmlGateway: public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(QmlGateway)

    //Q_PROPERTY(LocalClient *client READ client CONSTANT)

    /** Main QML viewer **/
    QDeclarativeView    *m_view;

public:
    /**
     * Get instance of QmlGateway
     * @return instance of QmlGateway
     */
    static QmlGateway &instance()
    {
        static QmlGateway _self;
        return _self;
    }

    /**
     * Get main QML viewer
     * @return QML view
     **/
    QDeclarativeView* view(void) const { return m_view; }

    /**
     * Set main QML viewer
     * @param view QML view
     **/
    void setView(QDeclarativeView* view) { m_view = view; }

    /**
     * Return width of text drawed with font
     **/
    Q_INVOKABLE int textWidth(const QFont &font, const QString &text) const;
   Q_INVOKABLE void beginAuth(); //Функция C++ вызываемая из QML
    //Q_INVOKABLE LocalClient *client() { return &m_client; }

private:
    QmlGateway(QObject *parent = NULL);
    virtual ~QmlGateway();

    //LocalClient m_client;
};

#endif /* QMLGATEWAY_H_ */
