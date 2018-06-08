import QtQuick 1.1

Item {
	id: button;

	// styledItem - parent item has properties:
	//	iconSource, text, pressed, hovered, enabled ...

	property Item       styledItem: (parent.styledItem) ? parent.styledItem : null;
	property variant	palette: styledItem.palette;

	anchors.fill: parent;

	Rectangle {
		id: background;

		anchors.fill: parent;

		border.width: internals.borderWidth;
		border.color: internals.borderColor;
		radius: 4;
		smooth: true;

		gradient: gradient;

		color: "transparent";
	}

	Gradient {
		id: gradient;
		GradientStop { position: 0.0; color: internals.grBegin; }
		GradientStop { position: 1.0; color: internals.grEnd; }
	}

	Gradient {
		id: gradientHovered;
		GradientStop { position: 0.0; color: internals.grHoveredBegin; }
		GradientStop { position: 1.0; color: internals.grHoveredEnd; }
	}

	Gradient {
		id: gradientSelected;
		GradientStop { position: 0.0; color: internals.grSelectedBegin; }
		GradientStop { position: 1.0; color: internals.grSelectedEnd; }
	}

	Gradient {
		id: gradientDisabled;
		GradientStop { position: 0.0; color: internals.grDisabledBegin; }
		GradientStop { position: 1.0; color: internals.grDisabledEnd; }
	}

	Column {
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;

		spacing: 5;

		Image {
            id: image;

			fillMode: Image.PreserveAspectFit;
			smooth: true;
			cache: true;

			width: 32;
			height: 32;

			anchors.horizontalCenter: parent.horizontalCenter;

			source: styledItem.iconSource;

			visible: (source != "")
		}

		Text {
			id: title;

			anchors.horizontalCenter: parent.horizontalCenter;

			color: palette.inactive.staticText;

			text: styledItem.text;

			width: paintedWidth;
		}
	}

	state: "normal";
	states:
	[
		State
		{
			name: "selected";
			when: styledItem.pressed && styledItem.enabled;
			PropertyChanges {
				target: background;
				border.color: internals.borderColorSelected;
				gradient: gradientSelected;
			}
			PropertyChanges {
				target: title;
				color: palette.active.staticText;
			}
		},
		State {
			name: "hovered";
			when: styledItem.hovered && styledItem.enabled;
			PropertyChanges {
				target: background;
				border.color: internals.borderColorHovered;
				gradient: gradientHovered;
			}
			PropertyChanges {
				target: title;
				color: palette.active.staticText;
			}
		},
		State {
			name: "disabled";
			when: !styledItem.enabled;
			PropertyChanges {
				target: background;
				border.color: internals.borderColorDisabled;
				gradient: gradientDisabled;
			}
			PropertyChanges {
				target: title;
				color: palette.disabled.staticText;
			}
		}
	]

	QtObject {
		id: internals;

		property int borderWidth: 1;

		property color borderColor: "white";
		property color borderColorHovered: "white";
		property color borderColorSelected: "#565656";
		property color borderColorDisabled: "#565656";

		property color grBegin:  "#E3E3E3";
		property color grEnd:    "#828282";

		property color grHoveredBegin:	"#E3E3E3";
		property color grHoveredEnd:	"#E3E3E3";

		property color grSelectedBegin: "#828282";
		property color grSelectedEnd:	"#E3E3E3";

		property color grDisabledBegin:  "#828282";
		property color grDisabledEnd:    "#828282";
	}
}
