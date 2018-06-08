import QtQuick 1.1

/**
 * Основной контейнер отображения стилевого компонента
 */
Item {
    id: styledItem;

	property variant palette: main.palette;

    /**
     * Стилевой компонент для отображения, назначается в родительском компоненте
     */
	property Component style;

	property Item __styleInstance: styleLoader.status == Loader.Ready ? styleLoader.item : null;

    width: __styleInstance ? __styleInstance.width : 0;
    height: __styleInstance ? __styleInstance.height : 0;

    Loader {
        id: styleLoader;
        //anchors.fill: parent;
        sourceComponent: style;
        property Item styledItem: styledItem;
    }
}

