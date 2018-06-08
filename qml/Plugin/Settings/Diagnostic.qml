import QtQuick 1.1
import '../../components'

Item {
    anchors.fill: parent;
    anchors.leftMargin: 1;

    property string title: qsTr('Диагностика');

    Column {
        anchors.fill: parent;
        anchors.margins: 8;
        anchors.leftMargin: 12;
        anchors.rightMargin: 12;

        spacing: 14;

        Text {
            width: parent.width;

            font.bold: true;
            font.pixelSize: 15;
            text: 'Схема взаимодействия';
            color: '#313E78';
        }

        Image {
            source: 'qrc:/resources/images/scheme.png';
        }

        Text {
            width: parent.width;

            font.bold: true;
            font.pixelSize: 15;
            text: 'Проверка взаимодействия с браузером';
            color: '#313E78';
        }

        Text {
            width: parent.width;

            textFormat: Text.RichText;
            wrapMode: Text.WordWrap;
            font.pixelSize: 14;
            text: '<div> Для проверки взаимодействия с браузером необходимо перейти на страницу <span class="asLink" data-href="https://online.sbis.ru/auth/checkConnect.html">диагностики</span>, на которой будут проверены все доступные варианты подключения к СБИС3 Плагин. <br><br> Переход будет осуществлен в браузер, указанный в системе как "Браузер по умолчанию". </div>';
            color: 'black';
        }

        Text {
            width: parent.width;

            font.bold: true;
            font.pixelSize: 15;
            text: 'Проверка доступности сетевых сервисов';
            color: '#313E78';
        }

        Button {
            text: 'Начать проверку';

            onClicked: {
                console.log('click');
            }
        }

        Column {
            width: parent.width;

            spacing: 6;

            height: childrenRect.height;

            Text {
                width: parent.width;

                font.pixelSize: 14;
                text: 'Результаты проверки:';
                color: '#999999';
            }

            Repeater
            {
                id: repeater;

                model: [
                    {
                        text: 'Сайт online.sbis.ru'
                    },
                    {
                        text: 'Сервис уведомлений'
                    },
                    {
                        text: 'Сервис обновлений'
                    }
                ];

                height: childrenRect.height;

                delegate: (model.length > 0) ? rowDelegate : null;
            }
        }
    }

    Component {
        id: rowDelegate;

        Row {
            height: 24;
            width: parent.width;

            Icon {
                anchors.fill: null;
                width: 24;
                height: parent.height;
                family: sbisMobileIcons.name;
                text: sbisMobileIcons.settingsBlack;
                font.pixelSize: 14;
                color: '#999999';
            }

            Text {
                height: parent.height;
                font.pixelSize: 14;
                color: '#999999';
                text: modelData.text;
                verticalAlignment: Qt.AlignVCenter;
            }
        }
    }
}
