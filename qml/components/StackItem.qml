import QtQuick 1.1

Item {
    id: root;

    width: parent.width;
    height: parent.height;

    property bool interactive: true;

    property int currentIndex: -1;
    property variant currentItem;

    onCurrentIndexChanged: {
        if (currentIndex >= 0)
        {
            currentItem  = root.children[currentIndex];
            root.children[currentIndex].visible = true;
        }
    }

    Component.onCompleted: {
        if (!root.currentItem && root.children.length > 0)
            root.initPage(children[0].objectName);
    }

    QtObject {
        id: internals;

        property bool isCompleted: true;
    }

    function initPage(name, source, properties)
    {
        if (!internals.isCompleted)
            return;

        var found = -1;
        for (var i = 0; i < root.children.length; i++)
        {
            if ( root.children[i].objectName === name )
            {
                found = i;
            }
        }

        if ( found == -1 )
        {
            if (!properties) properties = {};

            // Add properties
            properties.objectName = name;
            properties.visible = true;

            var component = Qt.createComponent(source);
            var page = component.createObject(root, properties);

            found = root.children.length - 1;
        }

        if (root.children[currentIndex])
        {
            if (interactive) {
                animationCurrent.target = root.children[currentIndex];
                animationNext.target = root.children[found];

                if (currentIndex > found)
                {
                    animationCurrent.to = parent.width;
                    root.children[found].x = -parent.width;
                }
                else
                {
                    animationCurrent.to = -parent.width;
                    root.children[found].x = parent.width;
                }

                animationNext.item = root.children[currentIndex];

                internals.isCompleted = false;
            }
            else
                root.children[currentIndex].visible = false;
        }

        currentIndex = found;
    }

    function reset()
    {
        if (currentIndex > 0)
        {
            for (; currentIndex > 0; currentIndex--)
            {
                root.children[currentIndex].destroy();
            }

            // show first page
            root.children[currentIndex].visible = true;
        }
    }

    function remove(name)
    {
        var found = -1;
        for (var i = 0; i < root.children.length; i++)
        {
            if ( root.children[i].objectName === name )
            {
                found = i;
            }
        }

        if (found >= 0) {
            if (found == currentIndex) {
                if (currentIndex > 0) currentIndex --;
                else currentIndex ++;

                if (root.children[currentIndex])
                    root.children[currentIndex].visible = true;
            }

            root.children[found].destroy();
        }
    }

    NumberAnimation {
        id: animationCurrent;

        target: null;
        running: (interactive && target && animationNext.target) ? animationNext.target.visible : false;

        properties: "x";
        to: 0;
        duration: 350;
    }

    NumberAnimation {
        id: animationNext;

        property Item item;

        target: null;
        running: (interactive && target) ? target.visible : false;

        properties: "x";
        to: 0;
        duration: 350;

        onCompleted: {
            item.visible = false;
            internals.isCompleted = true;
        }
    }
}
