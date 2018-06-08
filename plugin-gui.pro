# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# The .cpp file which was generated for your project. Feel free to hack it.
HEADERS += \
   qmlgateway.h \
   sbispluginconnector.h

SOURCES += \
    main.cpp \
    qmlgateway.cpp

INCLUDEPATH += \
   "C:\\git-tensor\\sbis3-launcher-unmanaged\\SbisPluginConnector\\SbisPluginConnector" \
   "C:\\git-tensor\\sbis3-launcher-unmanaged\\build-SbisPluginConnector\\bin\\"

RESOURCES += qml.qrc

LIBS += \
    -L"C:\\git-tensor\\sbis3-launcher-unmanaged\\build-SbisPluginConnector\\bin" -lSbisPluginConnector

#LIBS += L"C:\Qt\4.8.7\bin"

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick1applicationviewer/qtquick1applicationviewer.pri)
#qtcAddDeployment()

# Default rules for deployment.
include(deployment.pri)
