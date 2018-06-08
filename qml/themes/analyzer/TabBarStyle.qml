import QtQuick 1.1

Item {
    id: tabBar;

    property Item       item:           (parent.styledItem) ? parent.styledItem : null;

    property Item       tabsItem:       (item) ? item.tabsItem : null;
    property variant    palette:        (item) ? item.palette : null;

    width: (item) ? item.width : 0;
    height: (item) ? item.height : 0;

    Rectangle {
        anchors.fill: parent;
        color: "#A9A9A9";
    }

    Rectangle {
        anchors.left: parent.left;
        anchors.bottom: parent.bottom;
        width: parent.width;
        height: 1;
        color: "#808080";
    }

    Row
    {
        id: header;

        anchors.left: parent.left;
        anchors.leftMargin: 20;
        anchors.bottom: parent.bottom;

        spacing: 5;

        Repeater
        {
            model: tabsItem.__tabs;

            Item
            {
                width: 136;
                height: 35;

                Rectangle {
                    id: background;

                    width: parent.width;
                    height: parent.height;

                    gradient: Gradient {
                        GradientStop { position: 0.0; color: tabsItem.selectedTabIndex == index ? "white" : "#E4E4E4"; }
                        GradientStop { position: 1.0; color: tabsItem.selectedTabIndex == index ? "white" : "#C2C2C2"; }
                    }

                    Rectangle {
                        anchors.left: parent.left;
                        width: 1;
                        height: parent.height;
                        color: "#808080";
                    }

                    Rectangle {
                        anchors.right: parent.right;
                        width: 1;
                        height: parent.height;
                        color: "#808080";
                    }

                    Rectangle {
                        anchors.top: parent.top;
                        width: parent.width;
                        height: 1;
                        color: "#808080";
                    }

					Rectangle {
						anchors.bottom: parent.bottom;
						width: parent.width;
						height: 1;
						color: "#808080";

						visible: tabsItem.selectedTabIndex != index;
					}
				}

                Item {
                    height: parent.height;
                    width: parent.width;

                    Text {
                        id: caption;

                        anchors.fill: parent;

                        horizontalAlignment: Text.AlignHCenter;
                        verticalAlignment:  Text.AlignVCenter;

                        text: modelData.title;

                        color: tabBar.palette.inactive.staticText;
                        font.bold: true;
                    }
                }

                MouseArea
                {
                    id: mouse_area

                    anchors.fill: parent
                    onClicked: {
                        tabsItem.selectedTabIndex = index;
                    }
                }

                state: "unselected";
                states: [
                    State {
                        name: "pressed"
                        when: mouse_area.pressed
                        PropertyChanges {
                            target: caption;
                            color: tabBar.palette.active.staticText;
                        }
                    },
                    State {
                        name: "selected"
                        when: !mouse_area.pressed && (tabsItem.selectedTabIndex == index)
                        PropertyChanges {
                            target: caption;
                            color: tabBar.palette.active.staticText;
                        }
                    }
                ]
            }
        }
        // Repeater
    }
    // Row
}

