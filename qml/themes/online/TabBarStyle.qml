import QtQuick 1.1
import '../../components'

Item {
    id: tabBar;

    property Item       item:           (parent.styledItem) ? parent.styledItem : null;

    property Item       tabsItem:       (item) ? item.tabsItem : null;
    property variant    palette:        (item) ? item.palette : null;

    //width: (item) ? item.width : 0;
    //height: (item) ? item.height : 0;

    width: tabs.width;
    height: tabs.height;

    /*
    onWidthChanged: {
        console.log('W' + width);
    }

    Component.onCompleted: {
        console.log('C' + width);
    }

    onItemChanged: {
        console.log('I' + tabBar.width);
    }
    */

    Column
    {
        id: header;

        anchors.fill: parent;

        spacing: 0;

        Repeater
        {
            model: tabsItem.__tabs;

            Item
            {
                width: tabBar.width;
                height: 50;

                /**
                 * Подложка
                 */
                Rectangle {
                    id: background;

                    width: parent.width;
                    height: parent.height;

                    color: tabsItem.selectedTabIndex === index ? "white" : "#EAE9EC";
				}

                /**
                 * Маркер
                 */
                Rectangle {
                    height: parent.height;
                    width: 3;
                    color: '#FF7033';

                    visible: (tabsItem.selectedTabIndex === index);
                }

                Item {
                    height: parent.height;
                    width: parent.width;

                    /**
                     *  Иконка
                     */
                    Item {
                        anchors.left: parent.left;
                        width: 50;
                        height: parent.height;
                        Loader {
                            id: icon;
                            anchors.fill: parent;
                            sourceComponent: modelData.icon;
                        }

                        visible: (modelData.icon !== null);
                    }

                    /**
                     * Название раздела
                     */
                    Text {
                        id: caption;

                        anchors.fill: parent;
                        anchors.leftMargin: 50;

                        horizontalAlignment: Text.AlignLeft;
                        verticalAlignment:  Text.AlignVCenter;

                        text: modelData.title;

                        color: tabBar.palette.active.staticText;
                        font.pixelSize: 18;

                        visible: (tabs.isWide)
                    }

                    /**
                     * Кол-во непросмотренных - в виде текста
                     */
                    Text {
                        anchors.fill: parent;
                        anchors.rightMargin: 12;
                        verticalAlignment: Qt.AlignVCenter;
                        horizontalAlignment: Qt.AlignRight;
                        font.pixelSize: 18;
                        color: '#FF7033';
                        visible: tabs.isWide && text != '';

                        text: modelData.unread;
                    }
                }

                /**
                 * Кол-во непросмотренных - в виде круглого маркера
                 */
                Rectangle {
                    anchors.right: parent.right;
                    anchors.rightMargin: 6;
                    anchors.bottom: parent.bottom;
                    anchors.bottomMargin: 1;
                    radius: 6;
                    color: '#FF7033';
                    height: 16;
                    width: Gateway.textWidth(unread.font, unread.text) + 8;
                    visible: !tabs.isWide && unread.text != '';

                    Text {
                        id: unread;
                        height: parent.height;
                        width: parent.width;
                        verticalAlignment: Qt.AlignVCenter;
                        horizontalAlignment: Qt.AlignHCenter;
                        font.pixelSize: 12;
                        color: 'white';

                        text: modelData.unread;
                    }
                }

                MouseArea
                {
                    id: mouseArea;

                    anchors.fill: parent
                    onClicked: {
                        tabsItem.selectedTabIndex = index;
                    }
                }

                state: "unselected";
                states: [
                    State {
                        name: "pressed"
                        when: mouseArea.pressed
                        PropertyChanges {
                            target: caption;
                            color: tabBar.palette.active.staticText;
                        }
                    },
                    State {
                        name: "selected"
                        when: !mouseArea.pressed && (tabsItem.selectedTabIndex === index)
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

