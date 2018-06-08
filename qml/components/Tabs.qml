import QtQuick 1.1

Item {
    id: tabs

    property int selectedTabIndex: tabs.__tabs.length > 0 ? 0 : -1;

    property int countTabs: tabs.__tabs.length;

    property variant selectedTab: (selectedTabIndex < 0) || (__tabs.length <= selectedTabIndex) ? null : __tabs[selectedTabIndex]

    property Item currentPage: selectedTab ? selectedTab.page : null;

    property alias __tabs: tabsModel.tabList;

    default property alias tabChildren: tabsModel.children;

    TabBar {
        id: header;

        tabsItem: tabs;
    }

    Item {
        id: tabsModel;

        anchors.fill: parent;
        anchors.topMargin: header.height;

        property variant tabList: [];

        onChildrenChanged: {
            updateTabList();
        }

        function updateTabList() {
            var list = [];
            for (var i=0; i < children.length; i++) {
                if (isTab(tabsModel.children[i])) list.push(tabsModel.children[i]);
            }
            tabList = list;
        }

        function isTab(item) {
            if (item && item.hasOwnProperty("title")
                    && item.hasOwnProperty("page")) {
                return true;
            } else {
                return false;
            }
        }
    }
}
