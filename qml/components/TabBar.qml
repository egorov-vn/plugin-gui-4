import QtQuick 1.1

StyledItem {
    property Item tabsItem;

    property variant palette: main.palette;

    style: Qt.createComponent(main.theme + "/TabBarStyle.qml");
}
