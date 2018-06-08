import QtQuick 1.1

QtObject {
    id: action;

    property string text: "";

    property url iconSource: "";

    signal triggered(variant caller);

    property bool visible: true;

    property bool enabled: true;
}

