# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# The .cpp file which was generated for your project. Feel free to hack it.
HEADERS += \
    qmlgateway.h

SOURCES += \
    main.cpp \
    qmlgateway.cpp


RESOURCES += qml.qrc

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick1applicationviewer/qtquick1applicationviewer.pri)
#qtcAddDeployment()

# Default rules for deployment.
include(deployment.pri)
