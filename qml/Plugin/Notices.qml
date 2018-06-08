import QtQuick 1.1
import '../components'

Rectangle {
	id: block;

    /**
     * Тип отображаемых уведомлений
     */
    property int type: 0;

    /**
     * Расчетная высота блока уведомления
     */
    property int rowHeight: 150;

    color: 'white';

    anchors.fill: parent;

	QtObject {
		id: internals;

        property int qtyLoadingMessages: 0;

		function getListViewHeight(model)
		{
			var height = 0;

			for(var i = 0; i < model.count; i++) {
				height += 40 + model.get(i).fields.count * 16 + 35;
			}

			return height;
		}

        function loadExistingMessages() {
            // использовать internals.qtyLoadingMessages - для подгрузки уведомлений из базы
            init();
        }

        function init() {
            for (var i = 0; i < 10; i++)
            {
                modelUsers.append({
                    'id': (qtyLoadingMessages + i),
                    'type': 'Сообщение, тип: ' + type,
                    'date': '12 янв 12:45',
                    'name': qsTr('Test') + (qtyLoadingMessages + i),
                    'dep': 'Департамент',
                    'title': 'Заголовок',
                    'message': 'Сообщение Сообщение Сообщение Сообщение Сообщение Сообщение Сообщение Сообщение Сообщение Сообщение Сообщение Сообщение Сообщение'
                });
            }

            qtyLoadingMessages += 10;
        }

        function readNotice(id, index) {
            modelUsers.remove(index);
        }

        function toNotice(id, index) {
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

    /**
     * Шаблон для уведомления
     */
    Component {
        id: rowDelegate;

        Item {
            id: row;

            height: childrenRect.height;
            width: notices.width;

            Loader {
                id: myLoader;
                source: 'qrc:/qml/Plugin/Notice.qml';

                property variant rowModel: model;

                /**
                 * item - ссылка на загруженный компонент
                 */
                onLoaded: {
                    item.toNotice.connect(internals.toNotice);
                    item.readNotice.connect(internals.readNotice);
                    item.mouseHovered.connect(internals.mouseHovered);
                }
            }

            /**
             * Сепаратор между уведомлениями
             */
            Rectangle {
                anchors.top: myLoader.bottom;

                width: notices.width;
                height: 6;

                color: '#eae9ec';
            }
        }
    }

    /**
     * Заглушка при отсутствии уведомлений
     */
    Rectangle {
        anchors.fill: parent;
        visible: modelUsers.count == 0;

        color: 'white';

        Text {
            anchors.fill: parent;
            verticalAlignment: Qt.AlignVCenter;
            horizontalAlignment: Qt.AlignHCenter;
            text: 'Здесь будут появляться уведомления';
            color: '#dbdbdb';
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

            spacing: 6;

			height: childrenRect.height;

			Repeater
			{
				id: repeater;

				model: modelUsers;

                //height: (model) ? model.count * rowHeight : 0;
                height: childrenRect.height;

				delegate: (model.count > 0) ? rowDelegate : null;

				onCountChanged: {
                    //height = (model) ? model.count * rowHeight : 0;
				}
			}
		}
	}

	Scrollbar {
        id: scrollbar;

        flickableItem: flick;
        color: '#d9d9d9';

        positionOffset: 5;

        visible: internals.itemHovered || mouseArea.containsMouse;
	}
}
