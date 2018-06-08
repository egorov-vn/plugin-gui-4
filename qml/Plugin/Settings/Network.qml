import QtQuick 1.1
import '../../components'

Item {
    anchors.fill: parent;
    anchors.leftMargin: 1;

    property string title: qsTr('Сеть');

    Column {
        anchors.fill: parent;
        anchors.margins: 8;
        anchors.leftMargin: 12;
        anchors.rightMargin: 12;

        spacing: 8;

        RadioGroup {
            id: connectionType;

            width: parent.width;

            currentIndex: 0;

            items: [{
                id: 0,
                caption: 'Использовать настройки системы'
            }, {
                id: 1,
                caption: 'Прямое подключение'
            }, {
                id: 2,
                caption: 'Использовать прокси-сервер'
            }];

            onCurrentIndexChanged: {
            }
        }

        Item {
            width: parent.width;
            height: 30;

            Row {
                anchors.fill: parent;
                anchors.leftMargin: 24;

                spacing: 0;

                Text {
                    text: 'Адрес'
                    width: 80;
                    font.pixelSize: 14;
                    height: parent.height;
                    verticalAlignment: Text.AlignVCenter;
                    color: '#8991A9';
                }

                Rectangle {
                    width: 150;
                    height: parent.height;

                    border.width: 1;
                    border.color: '#dbdbdb';

                    ElementTextEdit {
                        id: address;
                        anchors.fill: parent;

                        setFocus: true;
                        text: '';
                        font.pixelSize: 14;
                        enabled: connectionType.currentIndex == 2;

                        maxLength: 30;

                        onTextChange: {
                        }
                    }
                }
            }
        }

        Item {
            width: parent.width;
            height: 30;

            Row {
                anchors.fill: parent;
                anchors.leftMargin: 24;

                spacing: 0;

                Text {
                    text: 'Порт'
                    width: 80;
                    font.pixelSize: 14;
                    height: parent.height;
                    verticalAlignment: Text.AlignVCenter;
                    color: '#8991A9';
                }

                Rectangle {
                    width: 150;
                    height: parent.height;

                    border.width: 1;
                    border.color: '#dbdbdb';

                    ElementTextEdit {
                        id: port;
                        anchors.fill: parent;

                        setFocus: true;
                        text: '8080';
                        font.pixelSize: 14;
                        enabled: connectionType.currentIndex == 2;

                        maxLength: 30;

                        onTextChange: {
                        }
                    }
                }
            }
        }


        CheckBox {
            text: 'Использовать авторизацию'
            enabled: connectionType.currentIndex == 2;
        }

        Item {
            width: parent.width;
            height: 30;

            Row {
                anchors.fill: parent;
                anchors.leftMargin: 24;

                spacing: 0;

                Text {
                    text: 'Логин'
                    width: 80;
                    font.pixelSize: 14;
                    height: parent.height;
                    verticalAlignment: Text.AlignVCenter;
                    color: '#8991A9';
                }

                Rectangle {
                    width: 150;
                    height: parent.height;

                    border.width: 1;
                    border.color: '#dbdbdb';

                    ElementTextEdit {
                        id: login;
                        anchors.fill: parent;

                        setFocus: true;
                        text: '';
                        font.pixelSize: 14;
                        enabled: connectionType.currentIndex == 2;

                        maxLength: 30;

                        onTextChange: {
                        }
                    }
                }
            }
        }

        Item {
            width: parent.width;
            height: 30;

            Row {
                anchors.fill: parent;
                anchors.leftMargin: 24;

                spacing: 0;

                Text {
                    text: 'Пароль'
                    width: 80;
                    font.pixelSize: 14;
                    height: parent.height;
                    verticalAlignment: Text.AlignVCenter;
                    color: '#8991A9';
                }

                Rectangle {
                    width: 150;
                    height: parent.height;

                    border.width: 1;
                    border.color: '#dbdbdb';

                    ElementTextEdit {
                        id: password;
                        anchors.fill: parent;

                        setFocus: true;
                        text: '';
                        font.pixelSize: 14;
                        enabled: connectionType.currentIndex == 2;

                        maxLength: 30;

                        onTextChange: {
                        }
                    }
                }
            }
        }

    }
}
