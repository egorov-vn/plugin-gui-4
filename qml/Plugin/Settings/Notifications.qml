import QtQuick 1.1
import '../../components'

Item {
    anchors.fill: parent;

    property string title: qsTr('Уведомления');

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

        contentHeight: content.height;

        clip: true;

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
            hoverEnabled: true;
        }

        Column {
            id: content;

            anchors.left: parent.left;
            anchors.right: parent.right;

            spacing: 0;

            height: childrenRect.height;

            // Отступ
            Item {
                height: 8;
                width: parent.width;
            }

            /**
             * Выбор типов уведомлений
             */
            Column {
                id: types;

                anchors.left: parent.left;
                anchors.right: parent.right;
                anchors.leftMargin: 12;
                anchors.rightMargin: 12;

                spacing: 6;

                height: childrenRect.height;

                Text {
                    width: parent.width;

                    font.bold: true;
                    font.pixelSize: 15;
                    text: 'О чем уведомлять';
                    color: '#313E78';
                }

                CheckBoxGroup {
                    width: parent.width;

                    items: [
                        {
                            id: 0,
                            checked: false,
                            caption: 'Документы'
                        },
                        {
                            id: 1,
                            checked: true,
                            caption: 'Новые задачи и инструкции'
                        },
                        {
                            id: 2,
                            checked: true,
                            caption: 'Отчетность'
                        },
                        {
                            id: 3,
                            checked: true,
                            caption: 'Личные сообщения'
                        },
                        {
                            id: 4,
                            checked: true,
                            caption: 'События календаря'
                        },
                        {
                            id: 5,
                            checked: true,
                            caption: 'Совещания'
                        },
                        {
                            id: 6,
                            checked: true,
                            caption: 'Нераспределенные документы'
                        },
                        {
                            id: 7,
                            checked: true,
                            caption: 'Обращения'
                        },
                        {
                            id: 8,
                            checked: true,
                            caption: 'Новости'
                        },
                        {
                            id: 9,
                            checked: true,
                            caption: 'Изменения у компании'
                        },
                        {
                            id: 10,
                            checked: true,
                            caption: 'Телефония'
                        }
                    ]
                }
            }

            // Отступ
            Item {
                height: 10;
                width: parent.width;
            }

            /**
             * Сепаратор между блоками
             */
            Rectangle {
                width: parent.width;
                height: 6;

                color: '#eae9ec';
            }

            // Отступ
            Item {
                height: 10;
                width: parent.width;
            }

            /**
             * Выбор браузера по умолчанию
             */
            Column {
                id: browsers;

                anchors.left: parent.left;
                anchors.right: parent.right;
                anchors.leftMargin: 12;
                anchors.rightMargin: 12;

                spacing: 6;

                height: childrenRect.height;

                Text {
                    width: parent.width;

                    font.bold: true;
                    font.pixelSize: 15;
                    text: 'Где просматривать';
                    color: '#313E78';
                }

                RadioGroup {
                    width: parent.width;

                    currentIndex: 0;

                    items: [
                        {
                            id: 0,
                            caption: 'Internet Explorer'
                        },
                        {
                            id: 1,
                            caption: 'Mozilla Firefox'
                        },
                        {
                            id: 2,
                            caption: 'Google Chrome'
                        },
                        {
                            id: 3,
                            caption: 'Opera'
                        },
                        {
                            id: 4,
                            caption: 'Yandex'
                        },
                        {
                            id: 5,
                            caption: 'Chromium'
                        },
                        {
                            id: 6,
                            caption: 'Google Chrome Canary'
                        }
                    ]
                }
            }

            // Отступ
            Item {
                height: 8;
                width: parent.width;
            }
        }
    }

    Scrollbar {
        id: scrollbar;

        flickableItem: flick;
        color: '#d9d9d9';

        positionOffset: 5;

        visible: mouseArea.containsMouse;
    }
}
