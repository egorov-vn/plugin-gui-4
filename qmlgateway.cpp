#include <QDateTime>
#include <QFontMetrics>
#include <QGraphicsObject>
#include <QTimer>

#include "qmlgateway.h"

#include "sbispluginconnector.h"
#include "tools.h"

#include <iostream>
#include "json/json.h"
#include <sbis-lib/types/record/recordset.hpp>

void answer(const char* data, int size)
{
   Json::Value root;
   Json::Reader reader;

   std::string answData;
   std::cout << std::string(data) << std::endl;
   //std::string view(data);
   //WriteToLog("Answer is:");
   //WriteToLog(std::string(data));
   bool success = reader.parse(data, root);
   if(success)
   {
      answData = root.get("type", "default data").asString(); ;
   }
   else
   {

   }
   //std::cout << answData << std::endl;
   /*
   std::cout << "answer was called" << std::endl;
   std::string text(data);
   std::cout << text << ":" << size << std::endl;
   */
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
   SetLogPath("c:\\logs");
   char *buf = new char[1024];
   //CallNewPluginMethod( "NoticeCenter", "0.0.0.0", "NoticeCenter.CallMe", "{ }", func, buf, 5000 );
   CallNewPluginMethod( "NoticeCenter", "0.0.0.0", "NoticeCenter.GetAccountsNoticesCount", "{ }", func, buf, 2000 );
   //CallNewPluginMethod( "NoticeCenter", "0.0.0.0", "GetAccountsNoticesCount", "{ }", func, buf, 2000 );
}
