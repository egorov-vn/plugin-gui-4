import QtQuick 1.1
import '../components'

Rectangle {
    anchors.fill: parent;
    anchors.margins: 1;
    anchors.topMargin: 0;
    anchors.leftMargin: 0;

    border.color: '#bdbdbd';
    border.width: 1;

    Head {
        id: head;

        anchors {
            top: parent.top;
            left: parent.left;
            right: parent.right;
        }

        z: 5;

        Navigator {
            id: navigator;

            anchors.left: parent.left;
            anchors.leftMargin: 12;

            width: childrenRect.width;

            onClicked: {
                if (container.currentIndex > 0)
                    container.back();
            }
        }
    }

    Component.onCompleted: {
        container.add('Auth', 'qrc:/qml/Plugin/Auth.qml', {});
    }

    /**
     * Контейнер для страниц
     */
    PageCollector {
        id: container;

        anchors.fill: parent;
        anchors.topMargin: head.height;

        onCurrentIndexChanged: {
            navigator.text = getCaption();
            navigator.showBack = (currentIndex != 0);
        }
    }
}
