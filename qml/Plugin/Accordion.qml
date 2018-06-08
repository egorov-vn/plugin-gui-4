import QtQuick 1.1
import '../components'

Rectangle {
    id: item;

    width: 50;
    height: parent.height;

    color: '#EAE9EC';

    property variant currentPage: tabBar.currentPage;

    property int selectedNoticetType:   tabBar.selectedTabIndex;
    property int selectedSettings:      tabBar2.selectedTabIndex;

    function setCount(type) {
    }

    /**
     * Гамбургер - раскрытие аккордиона
     */
    Item {
        id: top;

        height: 44;
        width: parent.width;

        Rectangle {
            id: base;

            color: '#003F60';
            anchors.fill: parent;
        }

        Icon {
            anchors.fill: null;
            width: 50;
            height: 44;
            family: sbisMobileIcons.name;
            text: sbisMobileIcons.menu;
            color: 'white';
        }

        /**
         * Логотип при раскрытом аккордионе
         */
        Image {
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.verticalCenter: parent.verticalCenter;
            source: 'qrc:/resources/images/logo.png';
            visible: tabBar.isWide;
        }

        MouseArea
        {
            anchors.fill: parent;
            onClicked: {
                if (!tabBar.isWide) {
                    item.width = 270;
                    tabBar.isWide = true;
                }
                else {
                    item.width = 50;
                    tabBar.isWide = false;
                }
            }
        }
    }

    /**
     * Разделы аккордиона
     */
    Tabs {
        id: tabBar;

        property bool isWide: false;

        selectedTabIndex: 0;

        onSelectedTabIndexChanged: {
            console.log('tab:' + selectedTabIndex);
            if ( selectedTabIndex >= 0 ) {
                tabBar2.selectedTabIndex = -1;
            }
        }

        anchors {
            top: top.bottom;
            left: parent.left;
            right: parent.right;
        }
        width: parent.width;

        Rectangle {
            anchors.fill: parent;
            border.color: 'red';
            border.width: 1;
            color: 'transparent';
        }

        Tab {
            width: parent.width;
            title: qsTr('Лента уведомлений');
            icon: Icon {
                text: '99+';
                color: 'black';
                font.pixelSize: 16;
            }
        }
        Tab {
            width: parent.width;
            title: qsTr('Сообщения');
            unread: '10';
            icon: Icon {
                family: sbisMobileIcons.name;
                text: sbisMobileIcons.menuMessages;
                color: 'black';
            }
        }
        Tab {
            width: parent.width;
            title: qsTr('Задачи');
            icon: Icon {
                family: sbisMobileIcons.name;
                text: sbisMobileIcons.task;
                color: 'black';
            }
        }
        Tab {
            width: parent.width;
            title: qsTr('Лента новостей');
            icon: Icon {
                family: sbisMobileIcons.name;
                text: sbisMobileIcons.menuNews;
                color: 'black';
            }
        }
        Tab {
            width: parent.width;
            title: qsTr('Документы');
            icon: Icon {
                family: sbisMobileIcons.name;
                text: sbisMobileIcons.paperPlane;
                color: 'black';
            }
        }
        Tab {
            width: parent.width;
            title: qsTr('Требования');
            icon: Icon {
                family: sbisMobileIcons.name;
                text: sbisMobileIcons.surveyors;
                color: 'black';
            }
        }
        Tab {
            width: parent.width;
            title: qsTr('Отчеты');
            icon: Icon {
                family: sbisMobileIcons.name;
                text: sbisMobileIcons.menuRequirements;
                color: 'black';
            }
        }
        Tab {
            width: parent.width;
            title: qsTr('Письма');
            icon: Icon {
                family: sbisMobileIcons.name;
                text: sbisMobileIcons.envelope;
                color: 'black';
            }
        }

        Tab {
            width: parent.width;
            title: qsTr('Прочие уведомления');
            icon: Icon {
                family: sbisMobileIcons.name;
                text: sbisMobileIcons.menuNotifications;
                color: 'black';
            }
        }
    }

    /**
     * Настройка
     */
    Tabs {
        id: tabBar2;

        property bool isWide: tabBar.isWide;

        selectedTabIndex: -1;

        onSelectedTabIndexChanged: {
            console.log('tab 2:' + selectedTabIndex);

            if ( selectedTabIndex >= 0 ) {
                tabBar.selectedTabIndex = -1;
            }
        }

        anchors {
            //top: tabBar.bottom;
            left: parent.left;
            right: parent.right;
            bottom: parent.bottom;
        }
        width: parent.width;
        height: 50;

        Tab {
            width: parent.width;
            title: qsTr('Настройки');
            icon: Icon {
                family: sbisMobileIcons.name;
                text: sbisMobileIcons.settingsBlack;
                color: 'black';
            }
        }
    }
}
