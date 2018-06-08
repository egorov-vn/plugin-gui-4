import QtQuick 1.1
import '../components'

Rectangle {
    width: parent.width;
    height: 44;

    color: "#003F60";

    /**
     * Передвижение окна
     */
    Item {
        anchors.right: parent.right;
        anchors.rightMargin: buttonClose.width;
        width: parent.width - buttonClose.width;
        height: parent.height;

        MouseArea {
            anchors.fill: parent;

            property variant previousPosition;

            onPressed: {
                previousPosition = Qt.point(mouseX, mouseY)
            }

            onPositionChanged: {
                if (pressedButtons == Qt.LeftButton) {
                    var dx = mouseX - previousPosition.x
                    var dy = mouseY - previousPosition.y
                    viewerWidget.pos = Qt.point(viewerWidget.pos.x + dx,
                                                viewerWidget.pos.y + dy)
                }
            }
        }
    }

    /**
     * Кнопка закрыть
     */
    Image {
        id: buttonClose;

        anchors.fill: null;
        anchors.right: parent.right;
        anchors.verticalCenter: parent.verticalCenter;
        width: 36;
        height: 24;
        fillMode: Image.Tile;
        clip: true;
        source: 'qrc:/resources/images/areaCloseButton.png';

        MouseArea {
            anchors.fill: parent;

            onClicked: {
                //QmlApplicationViewer.showMinimized();
                Qt.quit();
            }
        }
    }

}
