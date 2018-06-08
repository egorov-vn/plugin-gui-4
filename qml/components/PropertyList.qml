import QtQuick 1.1

Rectangle {
    id: list;

    default property alias content: column.children;

    property int rowHeight: 40;
    property alias model: listContent.model;
    property alias delegate: listContent.delegate;

	border.width: 1;
	border.color: "#808080";
    radius: 6;

    color: enabled ? "white" : "#f0f0f0";

    height: childrenRect.height;

    ListView
    {
        id: listContent;

        anchors {
            left: parent.left;
            right: parent.right;
        }

        height: model ? model.count * list.rowHeight : 0;

        interactive: false;

        visible: model ? true : false;
    }

    Column {
        id: column;
        width: parent.width;

        enabled: parent.enabled;

        visible: column.children.length > 0 ? true : false;
    }
}

