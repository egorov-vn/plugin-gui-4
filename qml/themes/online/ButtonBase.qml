import QtQuick 1.1

/**
 * Отображение кнопки
 */
Item {
	id: buttonStyle;

	// styledItem - parent item has properties:
	//	iconSource, text, pressed, hovered, enabled ...

	property Item       styledItem: (parent.styledItem) ? parent.styledItem : null;
	property variant	palette: styledItem.palette;

    property color		defaultColor:		'black'; //palette.inactive.staticText;
    property variant	defaultBorder:		'#ff7033'; //internals.border;

    height: 24;
    width: title.width;

    Rectangle {
        id: background;

        anchors.fill: parent;

        border.width: 1;
        border.color: '#ff7033';
        radius: 16;
        smooth: true;

        color: "transparent";

        Text {
            id: title;

            height: parent.height;
            width: Gateway.textWidth(font, text) + 24;

            horizontalAlignment: Text.AlignHCenter;
            verticalAlignment:  Text.AlignVCenter;

            text: styledItem.text;
            font.pixelSize: 14;
            color: 'black';
        }
    }

	state: "normal";
	states:
	[
		State
        {
            name: "hovered";
            when: styledItem.hovered && styledItem.enabled;
            PropertyChanges {
                target: background;
                color: '#fdecd9';
            }
        },
        State {
			name: "selected";
			when: styledItem.pressed && styledItem.enabled;
			PropertyChanges {
				target: background;
                color: '#fdd2c0';
			}
		},
		State {
			name: "disabled";
			when: !styledItem.enabled;
			PropertyChanges {
				target: background;
                border.color: '#999999';
			}
		}
	]

    /*
	QtObject {
		id: internals;

		property variant border: {
			"width": 1,
			"color": borderColor
		}

		property color borderColor: "#64A0D7";
		property color borderColorSelected: "#64A0D7";
		property color borderColorDisabled: "#64A0D7";

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

            buttonStyle.width = Gateway.textWidth(title.font, title.text) + 20;
		}

		Component.onCompleted: {
			updateColor();
			styledItem.colorChanged.connect(updateColor);

			updateBorder();
			styledItem.borderChanged.connect(updateBorder);
		}
	}

    */
}
