import QtQuick 1.1

AbstractButton {
	//	Color of text.
	property color color: __styleInstance.defaultColor;

	//	Border of button include width and color
	property variant border: __styleInstance.defaultBorder;

    property variant font: __styleInstance.defaultFont;

    style: Qt.createComponent(main.theme + "/ButtonBase.qml");
}
