import QtQuick 1.1

Item {
    id: item;

    property alias text: caption.text;
    property alias font: caption.font;

    property alias hovered: link.containsMouse;

    signal clicked();

    width: Gateway.textWidth(caption.font, caption.text);

    anchors.verticalCenter: parent.verticalCenter;

    Text {
        id: caption;

        height: parent.height;
        verticalAlignment: Qt.AlignVCenter;

        font.bold: true;
        font.pixelSize: 18;
        font.underline: link.containsMouse;

        color: '#0055BB';

        text: '';
    }

    MouseArea {
        id: link;

        anchors.fill: parent;
        hoverEnabled: true;

        onClicked: {
            item.clicked();
        }
    }
}
