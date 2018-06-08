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
            left: parent.left;
            leftMargin: 50;
            top: parent.top;
            right: parent.right;
        }

        z: 5;

        Navigator {
            id: navigator;

            anchors.left: parent.left;
            anchors.leftMargin: 12;

            width: childrenRect.width;

            visible: settings.visible;

            onClicked: {
                if (settings.currentIndex > 0)
                    settings.back();
            }
        }
    }

    /**
     * Выбор аккаунтов
     */
    AccountChooser {
        anchors.top: parent.top;
        anchors.left: parent.left;
        anchors.leftMargin: 50;
        width: childrenRect.width;

        visible: container.visible;

        z: 10;
    }

    /**
     * Типы уведомлений
     */
    Accordion {
        id: accordion;

        anchors.top: parent.top;
        anchors.left: parent.left;

        z: 20;

        Component.onCompleted: {
            container.add('Notices-' + selectedNoticetType, 'qrc:/qml/Plugin/Notices.qml', {
                type: selectedNoticetType
            });
        }

        onSelectedNoticetTypeChanged: {
            if (selectedNoticetType >= 0) {
                container.add('Notices-' + selectedNoticetType, 'qrc:/qml/Plugin/Notices.qml', {
                    type: selectedNoticetType
                });
                container.visible = true;
                settings.visible = false;
            }
        }

        onSelectedSettingsChanged: {
            if (selectedSettings >= 0) {
                settings.add('Settings', 'qrc:/qml/Plugin/Settings.qml', {
                });
                container.visible = false;
                settings.visible = true;
            }
        }
    }

    /**
     * Контейнер для страниц
     */
    PageCollector {
        id: container;

        anchors.fill: null;
        anchors.top: head.bottom;
        anchors.left: parent.left;
        anchors.leftMargin: 50;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;
    }

    /**
     * Контейнер для вложенных страниц, раздела Настроек
     */
    PageCollector {
        id: settings;

        anchors.fill: null;
        anchors.top: head.bottom;
        anchors.left: parent.left;
        anchors.leftMargin: 50;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;

        visible: false;

        onCurrentIndexChanged: {
            navigator.text = getCaption();
            navigator.showBack = (currentIndex != 0);
        }
    }
}
