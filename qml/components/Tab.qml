import QtQuick 1.1

Item {
    id: tab;

    anchors.fill: parent ? parent : undefined;

    property url iconSource: "";
    property string iconText: "";
    property string title: "";
    property string unread: "";
    property Component icon: null;

    property Item page: null;

    property variant tabs: parent.parent;

    onPageChanged: if (page) page.parent = tab;

    visible: tabs.hasOwnProperty("selectedTab") && tabs.selectedTab === tab;
}
