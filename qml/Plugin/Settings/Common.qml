import QtQuick 1.1
import '../../components'

Item {
    anchors.fill: parent;
    anchors.leftMargin: 1;

    property string title: qsTr('Общее');

    Column {
        anchors.fill: parent;
        anchors.margins: 8;
        anchors.leftMargin: 12;
        anchors.rightMargin: 12;

        spacing: 8;

        CheckBox {
            checked: true;
            text: 'Загружать СБИС3 Плагин при старте системы'
        }

        CheckBox {
            checked: true;
            text: 'Показывать всплывающие уведомления о новых событиях'
        }

        CheckBox {
            checked: true;
            text: 'Показывать системные информационные уведомления'
        }

        CheckBox {
            checked: true;
            text: 'Отображать поверх всех окон'
        }

        CheckBox {
            checked: true;
            text: 'Разрешить звуки'
        }
    }
}
