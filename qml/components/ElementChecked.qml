import QtQuick 1.1

Item {
	id: item;

    property bool checked: false;
    property bool pressed: false;

	signal clicked();

	width: 40;
	height: 40;

	Item {
		anchors.fill: parent;
		anchors.rightMargin: -10;

		Rectangle {
			width: parent.height - 8;
			height: parent.height - 8;

			anchors.verticalCenter: parent.verticalCenter;
			anchors.horizontalCenter: parent.horizontalCenter;

			border.width: 1;
			border.color: pressed ? "white" : "#c0c0c0";
			radius: 4;

			color: "transparent";
		}

		Image {
			anchors.verticalCenter: parent.verticalCenter;
			anchors.horizontalCenter: parent.horizontalCenter;

			width: sourceSize.width;
			height: sourceSize.height;

			fillMode: Image.PreserveAspectFit;

            //source: checked ? "qrc:/resources/images/bullet_green_sq.png" : "";
		}
	}

	MouseArea {
		anchors.fill: parent;

		onClicked: {
			item.clicked();
		}
	}
}
