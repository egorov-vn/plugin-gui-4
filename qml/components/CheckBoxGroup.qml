import QtQuick 1.1

Item {

    property variant items: [];

    width: parent.width;
    height: column.height;

    QtObject {
        id: internals;

        function init() {
            for (var i = 0; i < items.length; i++)
            {
                modelGroup.append(items[i]);
            }
        }

        property bool itemHovered: false;

        function mouseHovered(hovered) {
            itemHovered = hovered;
        }
    }

    Component.onCompleted: {
        internals.init();
    }

    ListModel {
        id: modelGroup;
    }

    Component {
        id: rowDelegate;

        Item {
            id: row;

            height: childrenRect.height;
            width: column.width;

            Loader {
                id: myLoader;
                source: 'qrc:/qml/components/CheckBox.qml';

                /**
                 * item - ссылка на загруженный компонент
                 */
                onLoaded: {
                    item.checked = model.checked;
                    item.value = model.id;
                    item.text = model.caption;
                }
            }
        }
    }

    Column {
        id: column;

        anchors.top: parent.top;
        anchors.left: parent.left;
        anchors.right: parent.right;

        spacing: 8;

        height: childrenRect.height;

        Repeater
        {
            id: repeater;

            model: modelGroup;

            //height: (model) ? model.count * rowHeight : 0;
            height: childrenRect.height;

            delegate: (model.count > 0) ? rowDelegate : null;

            onCountChanged: {
                //height = (model) ? model.count * rowHeight : 0;
            }
        }
    }
}
