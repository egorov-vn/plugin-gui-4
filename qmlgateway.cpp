#include <QDateTime>
#include <QFontMetrics>
#include <QGraphicsObject>
#include <QTimer>

#include "qmlgateway.h"

#include "sbispluginconnector.h"
//#include "tools.h"

#include <iostream>

void answer(const char* data, int size)
{
   std::cout << "answer was called" << std::endl;
   std::string text(data);
   std::cout << text << ":" << size << std::endl;
   //char *lData = new char[size];
   //memcpy(lData, data, size);
   //std::cout << data << " : " << size;
}

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
   CallbackTypeFunc func = &answer;
   //CallbackTypeFunc CallbackFunc = answer;
   SetLogPath("c:\\logs");
   //WriteToLog("starting...");
   //int a;
   char *buf = new char[1024];
   //char *buf2 = new char[1024];
   //strcpy(buf, "myGUIDvalue");
   //std::string text = "TestDataGUID";
   //std::string text (buf);
   //std::string text2(buf1);
   //(*func)(buf2, 123);
   //CallbackTypeFunc callback = answer;
   //CallbackTypeFunc callback = &answer;
   //callback(text.c_str(), 123);
   //cbf((text + text).c_str(), 123 * 2);
   //CallNewPluginMethod( "SBIS2Support", "0.0.0.1", "SBIS2Support.Subscribe", "{}", CallbackFunc, buf, timeout )
   //CallNewPluginMethod( "SBIS2Support", "0.0.0.1", "SBIS2Support.Subscribe", "{}", CallbackFunc, buf, 2000 );
   //std::string ret1;
   //std::string ret2;
   //CallNewPluginMethod( "HelloWorld", "1.0.0.0", "HelloWorld.Hello", "{}", callback, buf1, 5000 );
   //CallNewPluginMethod( "HelloWorld", "1.0.0.0", "HelloWorld.Hello", "{}", (*cbf), buf2, 5000 );
   // some return
   //CallNewPluginMethod( "WebUI", "0.0.0.0", "MainWindow.IsHidden", "{}", callback, buf1, 5000 );
   // test return
   CallNewPluginMethod( "HelloWorld", "0.0.0.0", "HelloWorld.Hello", "{ }", func, buf, 5000 );

   //CallNewPluginMethod( "WebUI", "0.0.0.0", "MainWindow.IsHidden", "{}", (*cbf), buf2, 5000 );
   //CallNewPluginMethod( "HelloWorld", "1.0.0.0", "OAuthService.GetToken2", "{}", callback, buf, 2000 );
   //std::string out(buf);
   //std::wstring out2(buf1);
   //std::string out2(buf2);
   //std::cout << out << ":" << out.length() << std::endl;
   //std::cout << out2 << ":" << out2.length() << std::endl;
   //CallNewPluginMethod("HelloWorld", "1.0.0.0", "Hello", );
   //GetPlugin("QtApplications", func, buf, TIME_TO_WAIT, "0.0.0.1", 0);
   //GetPlugin("WebUI", func, buf, TIME_TO_WAIT, "0.0.0.1", 0);

}
