#include <QDateTime>
#include <QFontMetrics>
#include <QGraphicsObject>
#include <QTimer>

#include "qmlgateway.h"

#include "sbispluginconnector.h"
#include "tools.h"

#include <iostream>
#include "json/json.h"

#include <sbis-lib/types/record/record.hpp>
#include <sbis-lib/types/record/recordset.hpp>
#include <sbis-lib/utils/string.hpp>

#include <sbis-lib/serialization/serialization.hpp>
#include <sbis-rpc/json_object_writer.hpp>
#include <sbis-rpc/json_parse.hpp>

//#include <utils/utils.h>

//#include <algorithm>
//#include <boost/algorithm/string.hpp>
#include <boost/locale.hpp>

void answer(const char* data, int size)
{
   Json::Value root;
   Json::Reader reader;
   char *in_data = new char[size + 1];
   std::strcpy(in_data, data);
   std::string ss0(in_data);
   bool success = reader.parse(in_data, root);
   if(success)
   {
      std::string str_data = root.get("data", "default data because no data presented").asString();
      //std::cout << "Only data: " << std::string(str_data) << std::endl;
      char *in_data2 = new char[str_data.size() + 1];
      std::strcpy(in_data2, str_data.c_str());
      std::string ss1(in_data2);
      Json::Reader reader2;
      Json::Value root2;
      bool success2 = reader2.parse(in_data2, root2);

      Json::CharReaderBuilder builder;
      Json::CharReader * builder_reader = builder.newCharReader();
      Json::Value builder_root;
      std::string errors;

      bool parsingSuccessful = builder_reader->parse(ss1.c_str(), ss1.c_str() + ss1.size(), &builder_root, &errors);
      delete builder_reader;

      if ( !parsingSuccessful )
      {
        std::cout << ss1 << std::endl;
        std::cout << errors << std::endl;
      }
      //std::string ores = builder_root.toStyledString();
      //std::cout << ores << std::cout;
      for( Json::Value::const_iterator outer = builder_root.begin() ; outer != builder_root.end() ; outer++ )
      {
        std::cout << outer.key() << ": " << *outer << std::endl;
        std::ostringstream oss_key, oss_value;
        oss_key << outer.key();
        oss_value << *outer;
        std::string str_key = oss_key.str();
        std::string str_value = oss_value.str();
        //
        /*
        rest.append(outer.key());
        rest.append(":");
        rest.append(*outer);
        */
        if(str_key == "\"result\"")
        {
           Json::Reader reader3;
           Json::Value root3;
           std::cout << str_value << std::endl;
           bool success3 = reader3.parse(str_value.c_str(), root3);
           std::shared_ptr<sbis::RecordSet> result;
           std::wstring wstr_data(str_value.begin(), str_value.end());
           try
           {
              std::unique_ptr<sbis::IObjectReader> reader( sbis::rpc::JsonParse( wstr_data, 3 ) );
              if(reader)
                 sbis::ReadValue(*reader, result);
           }
           catch( sbis::Exception &exc )
           {
              std::wstring err = L"Ошибка в функции CreateRecordSetByJson: " + exc.ErrorMessage() + L" " + exc.ErrorUserMessage();
              std::string s_err = boost::locale::conv::utf_to_utf<char, wchar_t>(err);
              std::cout << s_err << std::endl;
           }
           size_t a = result->Size();
           //std::cout << a << std::endl;
           sbis::Record rec = (*result)[0];
           a = rec.FieldsCount();
           a = rec.Count();
           int c1 = rec.Get<int>(L"user_id", 56);
           //sbis::RecordSet default_rs;
           std::shared_ptr<sbis::RecordSet> default_rs;
           sbis::RecordSet default_rs2;
           //std::ob
           sbis::FieldType ft = rec.TypeOf(L"counters");
           //sbis::String c2 = rec.Get<sbis::String>(L"counters", L"default_rs");
           //sbis::RecordSet c3 = rec.Get<sbis::RecordSet>(L"counters", default_rs2);

           for ( const sbis::Record& rec : *result)
           {
              for ( sbis::Record::ConstIterator idx = rec.Begin(); idx != rec.End(); idx++)
              {
               //std::cout << *idx.FieldName().c_str() << ":" << *idx.value_type.ToString() << ":" << *idx << std::endl;
                 sbis::String ts0 = idx.FieldName();

                 //std::cout << *idx << std::endl;

              }
              /*
              size_t b = rec.Count();
              std::cout << b << std::endl;
              sbis::String c1 = rec.Get<sbis::String>(L"type", L"default value1");
              //std::cout << c1. << std::endl;`
              sbis::String c2 = rec.Get<sbis::String>(L"unRead", L"default value2");
              //std::cout << c2 << std::endl;
              sbis::String c3 = rec.Get<sbis::String>(L"unView", L"default value3");
              //std::cout << c3 << std::endl;
              */
           }
        }
        /*
         for( Json::Value::const_iterator inner = (*outer).begin() ; inner!= (*outer).end() ; inner++ )
        {
          std::cout << inner.key() << ": " << *inner << std::endl;
        }
        */
        oss_key.flush();
        oss_value.flush();
      }

      if(success2)
      {
         std::string str_result;
         str_result = root2.get("jsonrpc", "default data because no data presented").asString();
         std::cout << "Only result: " << std::string(str_result) << std::endl;
         str_result = root2.get("id", "default data because no data presented").asString();
         std::cout << "Only result: " << std::string(str_result) << std::endl;
         str_result = root2.get("result", "default data because no data presented").asString();
         std::cout << "Only result: " << std::string(str_result) << std::endl;
         str_result = root2.get("protocol", "default data because no data presented").asString();
         std::cout << "Only result: " << std::string(str_result) << std::endl;

        \
      }




      std::shared_ptr<sbis::RecordSet> result;
      std::wstring wstr_data(str_data.begin(), str_data.end());
      try
      {
         std::unique_ptr<sbis::IObjectReader> reader( sbis::rpc::JsonParse( wstr_data, 3 ) );
         if(reader)
            sbis::ReadValue(*reader, result);
      }
      catch( sbis::Exception &exc )
      {
         std::wstring err = L"Ошибка в функции CreateRecordSetByJson: " + exc.ErrorMessage() + L" " + exc.ErrorUserMessage();
         std::string s_err = boost::locale::conv::utf_to_utf<char, wchar_t>(err);
         std::cout << s_err << std::endl;
      }
      size_t a = result->Size();
      std::cout << a << std::endl;
      for ( const sbis::Record& rec : *result)
      {
         size_t b = rec.Count();
         std::cout << b << std::endl;
         sbis::String c1 = rec.Get<sbis::String>(L"type", L"default value1");
         //std::cout << c1. << std::endl;
         sbis::String c2 = rec.Get<sbis::String>(L"unRead", L"default value2");
         //std::cout << c2 << std::endl;
         sbis::String c3 = rec.Get<sbis::String>(L"unView", L"default value3");
         //std::cout << c3 << std::endl;
      }
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
   std::cout << "Returned query id: " << std::string(buf) << std::endl;
}
