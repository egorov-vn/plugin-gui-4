import QtQuick 1.1
import '../components'

Item {
    id: item;

    property alias showBack: imgBack.visible;

    property alias text: caption.text;
    property alias font: caption.font;

    property alias hovered: link.containsMouse;

    signal clicked();

    width: row.childrenRect.width;
    height: parent.height;

    anchors.verticalCenter: parent.verticalCenter;

    Row {
        id: row;

        height: parent.height;

        spacing: 3;

        Image {
            id: imgBack;

            width: imgBack.visible ? sourceSize.width: 0;
            anchors.verticalCenter: parent.verticalCenter;
            source: 'qrc:/resources/images/BackArrowOrange.png';
        }

        Text {
            id: caption;

            height: parent.height;
            verticalAlignment: Qt.AlignVCenter;
            width: Gateway.textWidth(caption.font, caption.text);

            font.bold: true;
            font.pixelSize: 18;

            color: showBack && link.containsMouse ? '#bbe9ff' : 'white';

            text: '';
        }
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
