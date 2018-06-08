import QtQuick 1.1

ActionItem {
	id: button;

	signal clicked();

	onClicked: button.trigger();

	Keys.onEnterPressed: clicked();
	Keys.onReturnPressed: clicked();

	signal pressAndHold();

	property bool pressed: mouseArea.pressed;
	property bool hovered: __acceptEvents && mouseArea.containsMouse;

	property bool __acceptEvents: true;

	property alias __mouseArea: mouseArea;

    MouseArea {
		id: mouseArea;
		anchors.fill: parent;
		hoverEnabled: true;

        onClicked: {
            if (button.__acceptEvents) {
				button.clicked();
            }
        }
        onPressAndHold: {
            if (button.__acceptEvents) {
				button.pressAndHold();
            }
        }
    }
}

