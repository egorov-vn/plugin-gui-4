# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

#CONFIG += c++11# qt5
QMAKE_CXXFLAGS += -std=c++11 #(or QMAKE_CXXFLAGS += -std=c++0x

INCLUDEPATH += "C:\\git-tensor\\sbis3-launcher-unmanaged\\SbisPluginConnector"
INCLUDEPATH += "C:\\git-tensor\\sbis3-launcher-unmanaged\\SbisPluginConnector\\SbisPluginConnector"
INCLUDEPATH += "C:\\git-tensor\\sbis3-launcher-unmanaged\\SbisPluginConnector\\implementation"
INCLUDEPATH += "C:\\git-tensor\\sbis3-launcher-unmanaged\\build-SbisPluginConnector\\bin"
INCLUDEPATH += "C:\\git-code\\jsoncpp\\include"
INCLUDEPATH += "C:\\env\\SBISPlatformSDK_318350\\include"
INCLUDEPATH += "C:\\env\\Boost_1_53"

# The .cpp file which was generated for your project. Feel free to hack it.
HEADERS += \
   qmlgateway.h \
   sbispluginconnector.h \
   tools.h \
   notification-service.hpp \
   dist/json/json-forwards.h \
   dist/json/json.h
#  qtquick1applicationviewer/qtquick1applicationviewer.h

SOURCES += \
   main.cpp \
   qmlgateway.cpp \
   notification-service.cpp \
   dist/jsoncpp.cpp
#   tools.cpp
#    qtquick1applicationviewer/qtquick1applicationviewer.cpp

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
