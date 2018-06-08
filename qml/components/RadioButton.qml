import QtQuick 1.1

Item {
    id: item;

    property bool checked: true;
    property bool enabled: true;
    property variant value: null;
    property alias text: caption.text;

    signal clicked(variant value);

    width: row.childrenRect.width;
    height: 24;

    Row {
        id: row;

        height: parent.height;

        spacing: 0;

        Rectangle {
            height: 24;
            width: 24;

            Rectangle {
                width: 9;
                height: 9;
                radius: 4;
                border.color: checked ? '#ff7033' : '#999999';
                anchors.verticalCenter: parent.verticalCenter;
                anchors.horizontalCenter: parent.horizontalCenter;

                Rectangle {
                    width: 3;
                    height: 3;
                    radius: 1;
                    border.color: checked ? '#ff7033' : '#999999';
                    anchors.verticalCenter: parent.verticalCenter;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    visible: checked;
                    color: checked ? '#ff7033' : '#999999';
                }
            }
        }

        Text {
            id: caption;

            height: parent.height;
            verticalAlignment: Qt.AlignVCenter;
            width: Gateway.textWidth(caption.font, caption.text);

            font.pixelSize: 14;
            text: '';

            color: checked ? 'black' : '#999999';
        }
    }

    MouseArea {
        anchors.fill: parent;

        onClicked: {
            //checked = !checked;
            item.clicked(value);
        }
    }
}
