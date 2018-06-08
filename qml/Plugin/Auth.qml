import QtQuick 1.1
import '../components'

/**
 * Авторизация
 */
Item {
    anchors.fill: parent;

    property string title: qsTr('СБИС');

    /**
     * Фоновая картинка
     */
    Image {
        anchors.right: parent.right;
        anchors.rightMargin: 30;
        anchors.top: parent.top;
        anchors.topMargin: 190;

        width: 150;
        height: 192;
        smooth: true;
        source: 'qrc:/resources/images/auth/bg.jpg';
    }

    Column {
        anchors.left: parent.left;
        anchors.leftMargin: 50;
        anchors.right: parent.right;
        anchors.rightMargin: 90;
        anchors.top: parent.top;
        anchors.topMargin: 115;

        height: childrenRect.height;

        spacing: 50;

        /**
         * Сертификат
         */
        Rectangle {
            width: parent.width;
            height: 50;

            border.width: certArea.containsMouse || link.hovered ? 1 : 0;
            border.color: '#c8daf0';
            color: 'transparent';

            MouseArea {
                id: certArea;

                anchors.fill: parent;
                hoverEnabled: true;
            }

            Row {
                anchors.left: parent.left;
                anchors.leftMargin: 5;
                anchors.right: parent.right;

                height: parent.height;

                spacing: 5;

                Text {
                    height: 22;
                    width: Gateway.textWidth(font, text);
                    anchors.verticalCenter: parent.verticalCenter;

                    font.pixelSize: 18;
                    color: '#D94700';

                    text: 'или';
                }

                Link {
                    id: link;

                    height: 20;
                    text: 'По сертификату электронной подписи';

                    onClicked: {
                        main.authenticateByCert();
                    }
                }
            }
        }

        /**
         * Логин/пароль
         */
        Rectangle {
            width: parent.width;
            height: 110;

            border.width: loginArea.containsMouse || password.hovered || login.hovered || btn.hovered ? 1 : 0;
            border.color: '#c8daf0';
            color: 'transparent';

            MouseArea {
                id: loginArea;

                anchors.fill: parent;
                hoverEnabled: true;
            }

            Row {
                anchors.left: parent.left;
                anchors.leftMargin: 5;
                anchors.right: parent.right;
                anchors.verticalCenter: parent.verticalCenter;
                height: childrenRect.height;

                spacing: 10;

                Text {
                    height: 22;
                    width: Gateway.textWidth(font, text);
                    anchors.top: parent.top;
                    anchors.topMargin: 4;

                    font.pixelSize: 18;
                    color: '#D94700';

                    text: 'или';
                }

                Column {
                    anchors.top: parent.top;
                    anchors.topMargin: 4;

                    width: parent.width - 150;
                    height: childrenRect.height;

                    spacing: 12;

                    Rectangle {
                        width: parent.width;
                        height: 30;

                        border.width: 1;
                        border.color: '#dbdbdb';

                        ElementTextEdit {
                            id: login;
                            anchors.fill: parent;

                            setFocus: true;
                            text: 'демо_тензор';
                            font.pixelSize: 14;

                            maxLength: 30;

                            onTextChange: {
                            }
                        }
                    }

                    Rectangle {
                        width: parent.width;
                        height: 30;

                        border.width: 1;
                        border.color: '#dbdbdb';

                        ElementTextEdit {
                            id: password;
                            anchors.fill: parent;

                            echoMode: TextInput.Password;
                            setFocus: true;
                            text: '';
                            font.pixelSize: 14;

                            maxLength: 50;

                            onTextChange: {
                            }
                        }
                    }
                }

                /**
                 * Кнопка "Войти"
                 */
                Button {
                    id: btn;

                    text: 'Войти';
                    style: Qt.createComponent(main.theme + "/ButtonClose.qml");

                    onClicked: {
                        main.authenticateByPassword(login.text, password.text);
                    }
                }
            }
        }
    }

    /**
     * Настройки
     */
    Item {
        anchors.left: parent.left;
        anchors.bottom: parent.bottom;

        height: 50;
        width: 50;

        Icon {
            family: sbisMobileIcons.name;
            text: sbisMobileIcons.settingsBlack;
            color: settingArea.containsMouse ? 'black' : '#ebebeb';
        }

        MouseArea {
            id: settingArea;

            anchors.fill: parent;
            hoverEnabled: true;

            onClicked: {
                container.add('Settings', 'qrc:/qml/Plugin/Settings.qml', {});
            }
        }
    }
}
