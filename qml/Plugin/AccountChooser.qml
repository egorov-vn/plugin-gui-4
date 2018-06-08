import QtQuick 1.1
import '../components'

Rectangle {
    id: chooser;

    border.width: 1;
    border.color: 'red';

    width: rowWidth;

    property int rowHeight: 32;
    property int rowWidth: 0;

    /**
     * Список доступных аккаунтов
     */
    QtObject {
        id: internals;

        property variant model: [
            {
                userId: 0,
                userName: qsTr('Пользователь Пользователь') + 0,
                userClass: 'Пользователь клиента',
                clientName: qsTr('ООО Тояматоканава') + 0,
                selected: true,
                photo: ''
            },
            {
                userId: 1,
                userName: qsTr('Пользователь Пользователь') + 1,
                userClass: 'Пользователь клиента',
                clientName: qsTr('ООО Тояматоканава') + 1,
                selected: false,
                photo: ''
            },
            {
                userId: 2,
                userName: qsTr('Пользователь Пользователь') + 2,
                userClass: 'Пользователь клиента',
                clientName: qsTr('ООО Тояматоканава') + 2,
                selected: false,
                photo: ''
            }
        ];

        property variant currentUser: null;

        function init() {
            for (var i = 0; i < 3; i++) {
                accountModel.append(model[i]);
            }
        }

        function getUser() {
            currentUser = model[0];
        }
    }

    Component.onCompleted: {
        internals.init();
        internals.getUser();
    }

    /**
     * Текущий аккаунт
     */
    Rectangle {
        id: current;

        height: 44;
        width: chooser.width;

        color: !accountContainer.visible ? 'transparent' : '#EAEAEA';

        Row {
            id: row;

            anchors.left: parent.left;
            anchors.leftMargin: 12;

            height: parent.height;
            width: childrenRect.width;

            spacing: 6;

            Rectangle {
                width: 32;
                height: 32;

                border.color: '#bdbdbd';
                border.width: 0;

                radius: 5;
                clip: true;

                anchors { verticalCenter: parent.verticalCenter; }

                Image {
                    height: 32;
                    width: 32;
                    source: 'qrc:/resources/images/profile.png';
                }
            }

            Column {
                height: parent.height;

                spacing: 0;

                Text {
                    width: Gateway.textWidth(font, text);
                    height: parent.height /2;
                    verticalAlignment: Qt.AlignVCenter;
                    font.pixelSize: 16;
                    font.bold: true;
                    color: !accountContainer.visible ? 'white' : '#313E78';

                    text: internals.currentUser.userName;

                    onTextChanged: {
                        chooser.rowWidth = Math.max(Gateway.textWidth(font, text) + 24, chooser.rowWidth);
                    }
                }

                Text {
                    width: Gateway.textWidth(font, text);
                    height: parent.height /2;
                    verticalAlignment: Qt.AlignVCenter;
                    font.pixelSize: 14;
                    color: !accountContainer.visible ? '#8991A9' : '#90ABB9';

                    text: internals.currentUser.clientName;

                    onTextChanged: {
                        chooser.rowWidth = Math.max(Gateway.textWidth(font, text) + 24, chooser.rowWidth);
                    }
                }
            }
        }

        /**
         * Индикатор новых уведомлений
         */
        Rectangle {
            width: 8;
            height: 8;

            anchors.right: row.right;
            anchors.rightMargin: -8;
            anchors.bottom: row.bottom;
            anchors.bottomMargin: 4;

            visible: !accountContainer.visible;

            color: '#dbdbdb';
        }

        MouseArea
        {
            anchors.fill: parent;
            onClicked: {
                if (!accountContainer.visible) {
                    accountContainer.visible = true;
                }
                else {
                    accountContainer.visible = false;
                }
            }
        }
    }


    ListModel {
        id: accountModel;
    }

    /**
     * Шаблон для строки
     */
    Component {
        id: itemDelegate;

        Item {
            id: item;

            height: chooser.rowHeight;
            width: chooser.rowWidth;

            property variant index: parent.index;
            property string text: parent.text;
            property string iconFamily: parent.iconFamily;
            property string iconText: parent.iconText;
            property string iconColor: parent.iconColor;

            property bool hovered: mouseArea.containsMouse;

            signal clicked(variant index);

            onHoveredChanged: {
                if (hovered) {
                    background.color = '#f0f5fb';
                }
                else {
                    background.color = 'transparent';
                }
            }

            Rectangle {
                id: background;

                height: parent.height;
                width: parent.width - 1;

                anchors.top: parent.top;
                anchors.left: parent.left;
                anchors.leftMargin: 1;

                color: 'transparent';

                Row {
                    height: parent.height;
                    width: parent.width;

                    Component.onCompleted: {
                        chooser.rowWidth = Math.max(childrenRect.width + 40, chooser.rowWidth);
                    }

                    anchors.left: parent.left;
                    anchors.leftMargin: 12;

                    spacing: 6

                    Icon {
                        anchors.fill: null;
                        width: 32;
                        height: 32;
                        font.pixelSize: 16;
                        family: item.iconFamily;
                        text: item.iconText;
                        color: item.iconColor;
                    }

                    Text {
                        height: parent.height;
                        width: Gateway.textWidth(font, text);

                        verticalAlignment: Qt.AlignVCenter;

                        font.pixelSize: 14;
                        color: 'black';

                        text: item.text;
                    }
                }
            }

            MouseArea {
                id: mouseArea;

                hoverEnabled: true;

                anchors.fill: parent;

                onClicked: {
                    item.clicked(item.index);

                    // Скрываем
                    accountContainer.visible = false;
                }
            }
        }
    }

    /**
     * Шаблон для аккаунта
     */
    Component {
        id: rowDelegate;

        Item {
            id: row;

            height: chooser.rowHeight;
            width: chooser.rowWidth;

            Loader {
                sourceComponent: itemDelegate;

                property variant index: model.userId;
                property string text: model.userName;
                property string iconFamily: sbisIcons.name;
                property string iconText: sbisIcons.successful;
                property string iconColor: 'green';

                /**
                 * item - ссылка на загруженный компонент
                 */
                onLoaded: item.clicked.connect(processMouse);

                function processMouse(index) {
                    console.log('click on account: ' + index);
                }
            }
        }
    }

    /**
     * Отображение аккаунтов и доп. функций
     */
    Rectangle {
        id: accountContainer;

        anchors.top: current.bottom;
        anchors.left: parent.left;

        visible: false;

        height: childrenRect.height;
        width: parent.rowWidth;

        color: 'white';
        border.color: '#dbdbdb';
        border.width: 1;

        Column {
            id: accountList;

            anchors.top: parent.top;
            anchors.left: parent.left;

            height: childrenRect.height;
            width: parent.width;

            spacing: 0;

            Repeater
            {
                model: accountModel;

                height: (model) ? model.count * rowHeight : 0;

                delegate: (model.count > 0) ? rowDelegate : null;

                onCountChanged: {
                    height = (model) ? model.count * rowHeight : 0;
                }
            }
        }

        Column {
            anchors.top: accountList.bottom;
            anchors.left: parent.left;

            height: childrenRect.height;
            width: parent.width;

            spacing: 0;

            /*
            Loader {
                sourceComponent: itemDelegate;

                property variant index: 0;
                property string text: 'На рабочем месте';
                property string iconFamily: sbisIcons.name;
                property string iconText: sbisIcons.tfNewTab;
                property string iconColor: '#587AB0';
            }
            */

            Rectangle {
                width: parent.width;
                height: 1;
                border.width: 1;
                border.color: '#dbdbdb';
            }

            Loader {
                sourceComponent: itemDelegate;

                property variant index: 1;
                property string text: 'Перейти в личный кабинет';
                property string iconFamily: sbisIcons.name;
                property string iconText: sbisIcons.tfNewTab;
                property string iconColor: '#587AB0';
            }

            Rectangle {
                width: parent.width;
                height: 1;
                border.width: 1;
                border.color: '#dbdbdb';
            }

            Loader {
                sourceComponent: itemDelegate;

                property variant index: 2;
                property string text: 'Выход';
                property string iconFamily: sbisIcons.name;
                property string iconText: sbisIcons.outHotel;
                property string iconColor: '#587AB0';

                onLoaded: item.clicked.connect(processMouse);

                function processMouse() {
                    main.logout();
                }

                /*
                  оставим как пример

                Component.onDestruction: {
                    if (item) {
                        item.clicked.disconnect(processMouse);
                    }
                }
                */
            }
        }
    }
}
