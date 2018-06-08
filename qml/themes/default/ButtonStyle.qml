import QtQuick 1.1

Item {
	id: buttonStyle;

	// styledItem - parent item has properties:
	//	iconSource, text, pressed, hovered, enabled ...

	property Item       styledItem: (parent.styledItem) ? parent.styledItem : null;
	property variant	palette: styledItem.palette;

	property color		defaultColor:		palette.inactive.staticText;
	property Gradient	defaultGradient:	gradient;
	property variant	defaultBorder:		internals.border;

	anchors.fill: parent;

	Rectangle {
		id: background;

		anchors.fill: parent;

		border.width: defaultBorder.width;
		border.color: defaultBorder.color;
		radius: 4;
		smooth: true;

		gradient: defaultGradient;

		color: "transparent";
	}

	Gradient {
		id: gradient;

		GradientStop { position: 0.0; color: internals.grBegin; }
		GradientStop { position: 1.0; color: internals.grEnd; }
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

	Item {
		anchors.fill: parent;

		Text {
			id: title;

			width: parent.width;
			height: parent.height;

			horizontalAlignment: Text.AlignHCenter;
			verticalAlignment:  Text.AlignVCenter;

			text: styledItem.text;
			color: defaultColor;

			font.capitalization: Font.AllUppercase;
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
				target: buttonStyle;
				defaultColor: palette.active.staticText;
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
				target: buttonStyle;
				defaultColor: palette.disabled.staticText;
			}
		}
	]

	QtObject {
		id: internals;

		property variant border: {
			"width": 1,
			"color": borderColor
		}

		property color borderColor: "#64A0D7";
		property color borderColorSelected: "#64A0D7";
		property color borderColorDisabled: "#64A0D7";

		property color grBegin:  "#64A0D7";
		property color grEnd:    "#64A0D7";

		property color grSelectedBegin: "#64A0D7";
		property color grSelectedEnd:	"#64A0D7";

		property color grDisabledBegin:  "#64A0D7";
		property color grDisabledEnd:    "#64A0D7";

		function updateGradient() {
			if (styledItem.gradient) {
				grBegin = styledItem.gradient.stops[0].color;
				grEnd	= styledItem.gradient.stops[1].color;
			}
		}

		function updateColor() {
			if (styledItem.color) {
				title.color = styledItem.color;
			}
		}

		function updateBorder() {
			if (styledItem.border) {
				var tmp = {};
				tmp.width = styledItem.border.width;
				tmp.color = styledItem.border.color;
				border = tmp;
			}
		}

		Component.onCompleted: {
			updateGradient();
			styledItem.gradientChanged.connect(updateGradient);

			updateColor();
			styledItem.colorChanged.connect(updateColor);

			updateBorder();
			styledItem.borderChanged.connect(updateBorder);
		}
	}
}
