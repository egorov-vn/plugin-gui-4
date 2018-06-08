#include "qtquick1applicationviewer.h"
#include <QApplication>
#include <QDeclarativeContext>
#include <QDeclarativeEngine>
#include <QDeclarativeImageProvider>
#include <QFont>
#include <QFontDatabase>

#include "qmlgateway.h"

class ImageProvider : public QDeclarativeImageProvider
{
public:
   ImageProvider()
      : QDeclarativeImageProvider( QDeclarativeImageProvider::Image )
   {
   }

   QImage requestImage( const QString& id, QSize* size, const QSize& requestedSize )
   {
      Q_UNUSED( id );
      Q_UNUSED( requestedSize );

      QImage image;
      /*= QmlGateway::instance().client()->image();

      if (!image.isNull())
      {
          if (size)
              *size = QSize(image.width(), image.height());

          return image;
      }
      else
      {
          QImage image(1200, 100, QImage::Format_ARGB32);
          return image;
      }*/
      return image;
   }
};

int main( int argc, char* argv[] )
{
   QApplication app( argc, argv );

   // Установка по умолчанию шрифта для всего приложения
   int id = QFontDatabase::addApplicationFont( ":/resources/fonts/TensorFont.ttf" );
   QString family = QFontDatabase::applicationFontFamilies( id ).at( 0 );
   QFont font( family );
   font.setStyleStrategy(QFont::PreferAntialias);
   font.setPixelSize( 16 );
   QApplication::setFont( font );

   QtQuick1ApplicationViewer viewer;

   // Помогатор
   QmlGateway& gateway = QmlGateway::instance();
   //gateway.setView( &viewer );
   viewer.rootContext()->setContextProperty( "Gateway", &gateway );

   viewer.addImportPath( QLatin1String( "modules" ) );
   viewer.setOrientation( QtQuick1ApplicationViewer::ScreenOrientationAuto );
   viewer.setMainQmlFile( QLatin1String( "qrc:/qml/Plugin.qml" ) );
   // viewer.engine()->addImageProvider(QLatin1String("png"), new ImageProvider);

   // Для передвижения окна
   QDeclarativeContext* context = viewer.rootContext();
   context->setContextProperty( "viewerWidget", &viewer );

   /* publish viewer class to QML */
   viewer.rootContext()->setContextProperty( "QmlApplicationViewer", (QObject *)&viewer );

   // Скрытие бордера окна
   Qt::WindowFlags flags = 0;
   flags = Qt::CustomizeWindowHint | Qt::FramelessWindowHint;
   viewer.setWindowFlags( flags );

   viewer.show();

   return app.exec();
}
