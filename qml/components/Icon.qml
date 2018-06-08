import QtQuick 1.1

Text {
    id: icon;

    property string family: "";

    anchors.fill: parent;
    font.family: icon.family;
    font.pixelSize: 24;
    smooth: true;
    horizontalAlignment: Text.AlignHCenter;
    verticalAlignment: Text.AlignVCenter;
    //renderType: Text.NativeRendering;
}

