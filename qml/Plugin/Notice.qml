import QtQuick 1.1
import '../components'

Rectangle {
    id: row;

    property variant model: parent.rowModel;
    //property variant rowIndex: model.index;
    //property variant rowFields: rowModel.fields;

    height: childrenRect.height;
    width: notices.width;

    color: hovered ? '#f0f5fb' : 'white';

    property alias hovered: mouseArea.containsMouse;

    signal toNotice(int id, int index);
    signal readNotice(int id, int index);
    signal mouseHovered(bool hovered);

    onHoveredChanged: {
        mouseHovered(hovered);
    }

    MouseArea {
        id: mouseArea;

        hoverEnabled: true;

        anchors.fill: parent;
        //cursorShape: Qt.PointingHandCursor;

        onClicked: {
            toNotice(model.id, model.index);
        }
    }

    /**
     * Заголовок сообщения
     */
    Rectangle {
        id: header;

        height: 32;
        width: parent.width;
        color: row.hovered ? '#f0f5fb' : '#fbfbfb';

        Row {
            anchors.left: parent.left;
            anchors.leftMargin: 12;
            height: parent.height;

            spacing: 12;

            /**
             * Тип уведомления
             */
            Text {
                height: parent.height;
                verticalAlignment: Qt.AlignVCenter;
                color: '#8F8F9E';
                font.pixelSize: 14;

                text: model.type;
            }

            /**
             * Дата
             */
            Text {
                height: parent.height;
                verticalAlignment: Qt.AlignVCenter;
                color: '#BCBCC5';
                font.pixelSize: 12;

                text: model.date;
            }
        }

        Row {
            anchors.right: parent.right;
            anchors.rightMargin: 12;
            height: parent.height;

            spacing: 0;

            /**
             * Ссылка 'Прочитано'
             */
            Rectangle {
                height: parent.height;
                width: childrenRect.width;

                color: 'transparent';

                Text {
                    height: parent.height;
                    verticalAlignment: Qt.AlignVCenter;
                    color: '#0055BB';
                    font.pixelSize: 14;
                    font.underline: readArea.containsMouse;

                    visible: row.hovered || readArea.containsMouse;

                    text: 'Прочитано';
                }

                MouseArea {
                    id: readArea;

                    hoverEnabled: true;

                    anchors.fill: parent;

                    onClicked: {
                        readNotice(model.id, model.index);
                    }
                }
            }

            /**
             * Крестик
             */
            Icon {
                anchors.fill: null;
                height: parent.height;
                width: 10;
                verticalAlignment: Qt.AlignVCenter;
                color: '#8991A9';
                font.pixelSize: 12;

                text: '';
            }
        }
    }

    /**
     * Тело блока уведомления
     */
    Rectangle {
        anchors.top: header.bottom;

        width: parent.width - 12;
        height: childrenRect.height;

        color: 'transparent';
        clip: true;

        Row {
            anchors.top: parent.top;
            anchors.topMargin: 12;
            anchors.left: parent.left;
            anchors.leftMargin: 12;
            anchors.right: parent.right;
            anchors.rightMargin: 12;

            height: childrenRect.height;

            spacing: 12;

            Image {
                height: 40;
                width: 40;
                source: 'qrc:/resources/images/profile.png';
            }

            Column {
                anchors.top: parent.top;

                width: parent.width - 12 - 40;
                height: childrenRect.height;

                spacing: 0;

                Text {
                    height: 20;
                    verticalAlignment: Qt.AlignVCenter;

                    color: '#8991A9';
                    font.pixelSize: 16;

                    text: model.name;
                }

                Text {
                    height: 18;
                    verticalAlignment: Qt.AlignVCenter;

                    color: '#BCBCC5';
                    font.pixelSize: 14;

                    text: model.dep;
                }

                Text {
                    height: 22;
                    verticalAlignment: Qt.AlignVCenter;

                    color: '#313E78';
                    font.pixelSize: 16;
                    font.bold: true;

                    text: model.title;
                }

                Rectangle {
                    height: 76;
                    width: parent.width;

                    clip: true;
                    color: 'transparent';

                    Text {
                        anchors.fill: parent;

                        color: 'black';
                        font.pixelSize: 16;

                        wrapMode: Text.Wrap;
                        clip: true;
                        textFormat: Text.RichText;
                        text: model.message;
                    }

                    /**
                     * Размытие
                     */
                    Rectangle {
                        anchors.bottom: parent.bottom;
                        anchors.right: parent.right;
                        height: 35;
                        width: 150;

                        color: 'transparent';

                        Rectangle {
                            width: parent.height;
                            height: parent.width;
                            anchors.centerIn: parent;
                            rotation: 90;

                            gradient: Gradient {
                                GradientStop { position: 0.0; color: hovered ? '#f0f5fb' : 'white' }
                                GradientStop { position: 1.0; color: 'transparent' }
                            }
                        }
                    }
                }
            }
        }
    }
}
