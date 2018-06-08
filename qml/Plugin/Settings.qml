import QtQuick 1.1
import '../components'
import "../../config/settings.js" as Settings

Item {
	id: item;

    anchors.fill: parent;
    anchors.leftMargin: 1;

    property string title: qsTr('Настройки');
    property int rowHeight: 34;

	signal saveSettings;
	signal resetSettings;

    QtObject {
        id: internals;

        function getListViewHeight(model)
        {
            var height = 0;

            for(var i = 0; i < model.count; i++) {
                height += 40 + model.get(i).fields.count * 16 + 35;
            }

            return height;
        }

        function init() {
            var data = Settings.settings();

            for (var i = 0; i < data.length; i++)
            {
                modelUsers.append(data[i]);
            }
        }

        property bool itemHovered: false;

        function mouseHovered(hovered) {
            itemHovered = hovered;
        }
    }

    Component.onCompleted: {
        internals.init();
    }

    ListModel {
        id: modelUsers;
    }

    Component {
        id: settingsItem;

        Rectangle {
            //anchors.fill: parent;
            height: rowHeight;
            width: notices.width;

            color: mArea.containsMouse ? '#f0f5fb' : 'white';

            property variant model: parent.rowModel;

            MouseArea {
                id: mArea;

                hoverEnabled: true;

                anchors.fill: parent;
                //cursorShape: Qt.PointingHandCursor;

                onClicked: {
                    //toNotice(model.id, model.index);
                    container.add(model.id, 'qrc:/qml/' + model.source + '.qml', {});
                }
            }

            Row {
                id: row;

                anchors.fill: parent;
                anchors.leftMargin: 12;

                spacing: 8;

                Icon {
                    anchors.fill: null;
                    anchors.verticalCenter: parent.verticalCenter;

                    width: 16;
                    height: parent.height;

                    font.pixelSize: 16;
                    family: sbisIcons.name;
                    text: sbisIcons[model.icon];
                    color: '#313E78';
                }

                Text {
                    id: caption;

                    height: parent.height;
                    verticalAlignment: Qt.AlignVCenter;
                    width: Gateway.textWidth(caption.font, caption.text);

                    font.pixelSize: 14;

                    color: 'black';

                    text: model.caption;
                }
            }

            Icon {
                anchors.fill: null;
                anchors.right: parent.right;
                anchors.rightMargin: 10;
                anchors.verticalCenter: parent.verticalCenter;

                width: 16;
                height: rowHeight;

                font.pixelSize: 16;
                family: sbisIcons.name;
                text: sbisIcons.markCRightLight;
                color: '#587ab0';
            }
        }
    }

    /**
     * Шаблон для пункта настроек
     */
    Component {
        id: rowDelegate;

        Item {
            id: row;

            height: rowHeight;
            width: notices.width;

            Loader {
                id: myLoader;
                //source: 'qrc:/qml/Plugin/Notice.qml';
                sourceComponent: settingsItem;

                property variant rowModel: model;

                /**
                 * item - ссылка на загруженный компонент
                 */
                onLoaded: {
                    //item.toNotice.connect(internals.toNotice);
                    //item.readNotice.connect(internals.readNotice);
                    //item.mouseHovered.connect(internals.mouseHovered);
                }
            }
        }
    }

    Flickable
    {
        id: flick;

        anchors {
            top: parent.top;
            left: parent.left;
            right: parent.right;
            bottom: parent.bottom;
            leftMargin: 0;
            rightMargin: 0;
            topMargin: 0
            bottomMargin: 0;
        }

        flickableDirection: Flickable.VerticalFlick;
        boundsBehavior: Flickable.StopAtBounds;

        contentHeight: notices.height;

        clip: true;
        visible: modelUsers.count > 0;

        onFlickEnded: {
            if (flick.contentY + flick.height == flick.contentHeight)
                internals.loadExistingMessages();
        }

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
            hoverEnabled: true;
        }

        Column {
            id: notices;

            anchors.top: parent.top;
            anchors.left: parent.left;
            anchors.right: parent.right;

            spacing: 0;

            height: childrenRect.height;

            Repeater
            {
                id: repeater;

                model: modelUsers;

                height: (model) ? model.count * rowHeight : 0;
                //height: childrenRect.height;

                delegate: (model.count > 0) ? rowDelegate : null;

                onCountChanged: {
                    height = (model) ? model.count * rowHeight : 0;
                }
            }
        }
    }

    Scrollbar {
        id: scrollbar;

        flickableItem: flick;
        color: '#526D82';

        positionOffset: 5;

        visible: internals.itemHovered || mouseArea.containsMouse;
    }

}

