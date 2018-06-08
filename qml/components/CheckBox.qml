import QtQuick 1.0

Item {
	id: item;

    property bool checked: false;
    property variant value: null;
    property alias text: caption.text;

	signal clicked();

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
                width: 11;
                height: 11;
                border.color: '#999999';
                anchors.verticalCenter: parent.verticalCenter;
                anchors.horizontalCenter: parent.horizontalCenter;

                Icon {
                    anchors.fill: null;
                    anchors.left: parent.left;
                    anchors.top: parent.top;
                    anchors.topMargin: -6;
                    anchors.leftMargin: -1;
                    font.pixelSize: 18;
                    family: sbisIcons.name;
                    text: sbisIcons.checked;
                    color: item.enabled ? '#ff7033' : '#999999';
                    visible: checked;
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

            color: item.enabled ? 'black' : '#999999';
        }
    }

	MouseArea {
		anchors.fill: parent;

		onClicked: {
            if (item.enabled) {
                checked = !checked;
                item.clicked();
            }
		}
	}
}
