import QtQuick 1.1

Item {
    id: container;

    anchors.fill: parent;

    property int currentIndex: -1;

    /**
     * Добавить компонент и сделать активным
     */
    function add(name, source, properties) {
        var found = indexOf(name);

        if (currentIndex >= 0 && found !== currentIndex) {
            container.children[currentIndex].visible = false;
        }

        if ( found < 0 ) {
            if (!properties) properties = {};

            // Add properties
            properties.objectName = name;
            properties.visible = true;

            var component = Qt.createComponent(source);
            var page = component.createObject(container, properties);

            page.anchors.fill = container;

            found = container.children.length - 1;
        }
        else {
            container.children[found].visible = true;
        }

        currentIndex = found;
    }

    /**
     *
     */
    function remove(name) {
        var found = indexOf(name);

        if (found >= 0) {
            if (found === currentIndex) {
                if (currentIndex > 0) currentIndex --;
                else currentIndex ++;

                if (container.children[currentIndex])
                    container.children[currentIndex].visible = true;
            }

            container.children[found].destroy();
        }
    }

    /**
     *
     */
    function indexOf(name) {
        var found = -1;
        for (var i = 0; i < container.children.length; i++) {
            if ( container.children[i].objectName === name ) {
                found = i;
            }
        }

        return found;
    }

    function getCaption() {
        return container.children[currentIndex].title;
    }

    function back() {
        remove(container.children[currentIndex].objectName);
    }
}
