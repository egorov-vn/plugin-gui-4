import QtQuick 1.1

Item {

    property variant items: [];
    property int currentIndex: -1;

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

        function changeCurrentIndex(value) {
            currentIndex = value;
            for (var i = 0; i < modelGroup.count; i++) {
                //modelGroup.setProperty(i, "checked", i === value ? true : false);
                repeater.itemAt(i).checked = (i === value ? true : false);
            }
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

            property bool checked: currentIndex === model.id ? true : false;

            onCheckedChanged: {
                if (myLoader.item)
                    myLoader.item.checked = checked;
            }

            Loader {
                id: myLoader;
                source: 'qrc:/qml/components/RadioButton.qml';

                /**
                 * item - ссылка на загруженный компонент
                 */
                onLoaded: {
                    item.checked = row.checked;
                    item.value = model.id;
                    item.text = model.caption;

                    item.clicked.connect(internals.changeCurrentIndex);
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
