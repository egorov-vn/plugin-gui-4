import QtQuick 1.1

/**
 * Отображение кнопки
 */
Image {
    property color		defaultColor:		'black'; //palette.inactive.staticText;
    property variant	defaultBorder:		'#ff7033'; //internals.border;


    fillMode: Image.Tile;
    clip: true;
    width: 86;
    height: 80;
    smooth: true;
    source: 'qrc:/resources/images/auth/btn.png';

    Text {
        anchors.verticalCenter: parent.verticalCenter;
        anchors.left: parent.left;
        anchors.leftMargin: 18;
        text: styledItem.text;
    }

    /*
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
    */
}
