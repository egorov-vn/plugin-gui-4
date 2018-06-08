import QtQuick 1.1

Item {
    id: item;

	property Item valueState: null;

	onValueStateChanged: {
		valueState.parent = container;
	}

    property alias name: title.text;
    property bool readonly: false;
    property bool isEnabled: item.parent.enabled;
    property int cnt: 0;

    height: 40;
    anchors {
        left: parent.left;
        right: parent.right;
        margins: 1;
    }

    default property alias content: row.children;

    // if use PropertyList with Column
    property int rowCount: item.parent.children.length;

    // if use PropertyList with ListView
    property int modelRowCount: 0;

    signal clicked();

    Component.onCompleted: {
        separator.visible = !isBeginRow();
    }

    function getRowCount()
    {
        var count = 0;
        
        for(var i = 0; i < item.parent.children.length; i++)
            if (item.parent.children[i].visible)
                count ++;

        if (modelRowCount > 0)
        	count = modelRowCount;
        	
        return count;
    }

    function isBeginRow()
    {
        var result = false;

        if (rowCount > 0)
            result = (item === item.parent.children[0]);

        if (modelRowCount > 0)
            result = (model.index === 0);

        return result;
    }

    function isEndRow()
    {
        var result = false;

        if (rowCount > 0)
            result = (item === item.parent.children[rowCount - 1]);

        if (modelRowCount > 0)
            result = (model.index === (modelRowCount - 1));

        return result;
    }

    MouseArea {
        id: mouseArea;

        anchors.fill: parent;
        onPressed: {
            item.focus = true;
            item.cnt ++;
        }

        onReleased: {
            item.focus = false;
        }

        onClicked: item.clicked();

        enabled: !readonly;
    }

    Item {
        anchors.fill: parent;

        Rectangle {
            id: backBottom;

            width: parent.width;
            height: 4;

            anchors.top: isEndRow() ? parent.top : parent.verticalCenter;
            anchors.bottom: isBeginRow() ? parent.bottom : parent.verticalCenter;
            visible: (getRowCount() != 1) && (isBeginRow() || isEndRow());

            color: "transparent";
        }

        Rectangle {
            id: back;

            anchors.fill: parent;
            anchors.topMargin: 1;

            radius: isBeginRow() || isEndRow() ? 5 : 0;
            smooth: true;

            color: "transparent";

            gradient: Gradient {
               GradientStop { id: gr1; position: 0.0; color: "transparent"; }
               GradientStop { id: gr2; position: 1.0; color: "transparent"; }
            }
        }

		Row {
			anchors.left: parent.left;
			anchors.leftMargin: 20;
			anchors.verticalCenter: parent.verticalCenter;

			spacing: 10;

			Item {
				id: container;

				visible: container.children.length > 0;

				height: parent.height;
				width: container.children.length > 0 ? childrenRect.width : 0;
			}

			Text {
				id: title;

				color: isEnabled ? "black" : "#808080";
			}
		}

        Row {
            id: row;
            anchors.right: parent.right;
            anchors.rightMargin: 20;
            anchors.verticalCenter: parent.verticalCenter;
            spacing: 15;
        }
    }

    Rectangle {
        id: separator;
        anchors.top: parent.top;
		height: 1;
        width: parent.width;
		color: "#808080";
    }

    state: "select";
    states: [
       State {
          name: "select";
          when: mouseArea.pressed && !readonly;
          PropertyChanges {
             target: gr1;
             color: "#6290F6";
          }
          PropertyChanges {
             target: gr2;
             color: "#373CA2";
          }
          PropertyChanges {
              target: backBottom;
              color: isBeginRow() ? "#373CA2" : "#6290F6";
          }
          PropertyChanges {
              target: title;
              color: "white";
          }
       },
       State {
          name: "unselect";
          when: !mouseArea.pressed;
       }
    ]

}
