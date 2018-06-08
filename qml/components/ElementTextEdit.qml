import QtQuick 1.1

Rectangle {
    id: rectangle;

    SystemPalette {id: palette}

    property bool activeStateOn: true;
    property color borderColor: "black";
    property color borderColorWhenActive: "black";
    property color borderColorWhenHovered: "black";
    property int borderWidth: 0;
    property color colorWhenDefault: "transparent";
    property color colorWhenActive: "transparent";
    property color colorWhenHovered: "transparent";
    property alias font: lineEdit.font;

    property bool gradientActiveOn: false;
    property bool gradientDefaultOn: false;
    property bool gradientHoveredOn: false;
    property Gradient gradientWhenActive: Gradient {}
    property Gradient gradientWhenDefault: Gradient {}
    property Gradient gradientWhenHovered: Gradient {}
    property bool hoveredStateOn: true;
    property real roundness: 0.5;
    property color textColor: "black";
    property color textColorWhenSelected: palette.highlightedText;
    property color textAreaColorWhenSelected: palette.highlight;

    property int maxLength: -1;
    property bool cursorVisible: false;
    property alias selectionStart: lineEdit.selectionStart;
    property alias selectionEnd: lineEdit.selectionEnd;
    property alias cursorPosition: lineEdit.cursorPosition;
    property bool setFocus: false;
    property alias text: lineEdit.text;
    property Gradient nullGradient: Gradient{}

    property alias cursorDelegate: lineEdit.cursorDelegate;
    property alias inputMask: lineEdit.inputMask;
    property alias validator: lineEdit.validator;
    property alias echoMode: lineEdit.echoMode;

    property bool hovered: mouseArea.containsMouse;

    signal clicked();
    signal textChange();

    width: 150;
    height: 40;
    color: rectangle.colorWhenDefault;
    smooth: false;
    radius: 6;
    border.color: rectangle.borderColor;
    border.width: rectangle.borderWidth;


    Component.onCompleted: {
        if (!rectangle.hoveredStateOn) stateHovered.destroy();
        if (!rectangle.activeStateOn) stateActive.destroy();
        if (maxLength != -1 && lineEdit.text.length >= maxLength) {
            lineEdit.text = lineEdit.text.slice(0,maxLength);
            lineEdit.cursorPosition = maxLength;
        }
    }

    /**
     * Function which can be used to insert text in lineEdit.
     *
     * @param insert Text to insert.
     * @return nothing
     */
    function insertText(insert) {
        var selection = lineEdit.selectedText;
        var selectionStart = lineEdit.selectionStart;
        var selectionEnd = lineEdit.selectionEnd;
        if (selection == "") {
            var cursor = lineEdit.cursorPosition;
            var start = lineEdit.text.substring(0,cursor);
            var end = lineEdit.text.substring(cursor,lineEdit.text.length);
            var resultText = ""+start+insert+end;
            lineEdit.text = resultText;
            lineEdit.cursorPosition = cursor+1;
        }
        else {
            var start = lineEdit.text.substring(0,selectionStart);
            var end = lineEdit.text.substring(selectionEnd,lineEdit.text.length);
            var resultText = ""+start+insert+end;
            lineEdit.text = resultText;
            lineEdit.cursorPosition = selectionEnd;
        }
    }

    /**
     * Function which is used to remove text in text lineEdit.
     */
    function removeText() {
        var selection = lineEdit.selectedText;
        var selectionStart = lineEdit.selectionStart;
        var selectionEnd = lineEdit.selectionEnd;
        if (selection == "") {
            var cursor = lineEdit.cursorPosition;
            if (cursor > 0) {
                var cursor = lineEdit.cursorPosition;
                var start = lineEdit.text.substring(0,cursor-1);
                var end = lineEdit.text.substring(cursor,lineEdit.text.length);
                var resultText = ""+start+end;
                lineEdit.text = resultText;
                lineEdit.cursorPosition = cursor-1;
            }
            else {
                lineEdit.cursorPosition = 0;
            }
        }
        else {
            var start = lineEdit.text.substring(0,selectionStart);
            var end = lineEdit.text.substring(selectionEnd,lineEdit.text.length);
            var resultText = ""+start+end;
            lineEdit.text = resultText;
            lineEdit.cursorPosition = selectionStart;
        }
    }

    /**
     * Makes text selection between given parameters
     *
     * @param start where selection starts.
     * @param end where selection ends.
     *
     */
    function selectText (start,end){
        lineEdit.cursorPosition = start;
        lineEdit.moveCursorSelection(end);
        return;
    }

    Rectangle {
        id: gradientContainer

        anchors.fill: rectangle
        color: rectangle.colorWhenDefault
        gradient: (rectangle.gradientDefaultOn)?rectangle.gradientWhenDefault:rectangle.nullGradient
        radius: rectangle.radius
    }

    MouseArea {
        id: mouseArea

        anchors.fill: rectangle
        onClicked: rectangle.clicked()
        hoverEnabled: true;
    }

    TextInput {
        id: lineEdit;

        onTextChanged: {
            rectangle.textChange();

            if (maxLength != -1 && lineEdit.text.length >= maxLength) {
                lineEdit.text = lineEdit.text.slice(0,maxLength);
                lineEdit.cursorPosition = maxLength;
            }
        }

        text: '';
        x: roundness * 5 + 2;
        focus: rectangle.setFocus;
        cursorVisible: rectangle.cursorVisible;
        width: rectangle.width - x * 2;
        height: rectangle.height * 0.6;
        color: textColor;
        anchors.verticalCenter: rectangle.verticalCenter;
        selectedTextColor: textColorWhenSelected
        selectionColor: textAreaColorWhenSelected
        selectByMouse: true;

        enabled: parent.enabled;
        
        onActiveFocusChanged: {
            // Focus Event
            //QmlAccessible.updateAccessibility(lineEdit, 0, 0x8005);
            // StateChanged Event
            //QmlAccessible.updateAccessibility(lineEdit, 0, 0x800A);
        }

        onVisibleChanged: {
            // Show/Hide Event
            //if (lineEdit.visible)
            //    QmlAccessible.updateAccessibility(lineEdit, 0, 0x8002);
            //else
            //    QmlAccessible.updateAccessibility(lineEdit, 0, 0x8003);
            // StateChanged Event
            //QmlAccessible.updateAccessibility(lineEdit, 0, 0x800A);
         }
         
		Component.onCompleted: {
			if (rectangle.setFocus)
				lineEdit.forceActiveFocus()
		}         
    }
    states: [
        State {
            id: stateActive;
            name: 'active'; when: lineEdit.focus
            PropertyChanges { target: gradientContainer; gradient: (rectangle.gradientActiveOn)?rectangle.gradientWhenActive:rectangle.nullGradient;}
            PropertyChanges { target: rectangle; border.color: rectangle.borderColorWhenActive }
            PropertyChanges { target: rectangle; color: rectangle.colorWhenActive}

        },
        State {
            id: stateHovered
            name: 'entered'; when: mouseArea.containsMouse
            PropertyChanges { target: gradientContainer; gradient: (rectangle.gradientHoveredOn)?rectangle.gradientWhenHovered:rectangle.nullGradient;}
            PropertyChanges { target: rectangle; border.color: rectangle.borderColorWhenHovered }
            PropertyChanges { target: rectangle; color: rectangle.colorWhenHovered}
        }
    ]
}
