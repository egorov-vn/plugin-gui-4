import QtQuick 1.1
import '../components'


Rectangle {
    anchors.fill: parent;
    anchors.margins: 1;
    anchors.topMargin: 0;
    anchors.leftMargin: 0;

    border.color: '#bdbdbd';
    border.width: 1;

    Loader {
        id: myLoader;
        source: 'qrc:/qml/Plugin/Notice.qml';

        property variant rowModel: model;

        /**
         * item - ссылка на загруженный компонент
         */
        onLoaded: {
            item.toNotice.connect(internals.toNotice);
            item.readNotice.connect(internals.readNotice);
            item.mouseHovered.connect(internals.mouseHovered);
        }
    }

}
