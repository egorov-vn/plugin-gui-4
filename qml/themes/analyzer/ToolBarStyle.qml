import QtQuick 1.1

Item {
	anchors.fill: parent;

	Rectangle {
		id: background;

		anchors.fill: parent;

		gradient: Gradient {
			GradientStop { position: 0.0; color: "#949494"; }
			GradientStop { position: 0.5; color: "#676767"; }
			GradientStop { position: 1.0; color: "#979797"; }
		}
	}
}

