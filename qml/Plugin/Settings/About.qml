import QtQuick 1.1
import '../../components'

Item {
    anchors.fill: parent;
    anchors.leftMargin: 1;

    property string title: qsTr('О программе');

    Flickable
    {
        id: flick;

        anchors {
            top: parent.top;
            left: parent.left;
            right: parent.right;
            bottom: parent.bottom;
            leftMargin: 0;
            rightMargin: 0;
            topMargin: 0
            bottomMargin: 0;
        }

        flickableDirection: Flickable.VerticalFlick;
        boundsBehavior: Flickable.StopAtBounds;

        contentHeight: content.height;

        clip: true;

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
            hoverEnabled: true;
        }

        Column {
            id: content;

            anchors.left: parent.left;
            anchors.right: parent.right;
            anchors.leftMargin: 12;
            anchors.rightMargin: 12;

            height: childrenRect.height;

            spacing: 0;

            // Отступ
            Item {
                height: 8;
                width: parent.width;
            }

            Text {
                width: parent.width;

                font.bold: true;
                font.pixelSize: 15;
                text: 'СБИС3 Плагин <version>';
                color: '#313E78';
            }

            // Отступ
            Item {
                height: 10;
                width: parent.width;
            }

            Text {
                width: parent.width;

                textFormat: Text.RichText;
                wrapMode: Text.WordWrap;
                font.pixelSize: 14;
                text: '<div tabindex="0"> СБИС3 Плагин - это программный модуль, необходимый для работы на online.sbis.ru. Запускается автоматически с включением компьютера и предназначен для: <div class="SBISPlugin-About__separator"></div><ul><li>Оповещения о новых уведомлениях: сообщениях, задачах, новостях</li><li> Работы с электронной подписью на носителе, а именно: <div></div><ul><li>Для входа в online.sbis.ru по сертификату</li><li>Выпуска электронной подписи на носителе</li><li>Подписания, шифрования и расшифровки документов и отчетности</li></ul></li><li>Редактирования файлов Microsoft Office, вложенных в электронный документ</li><li class="SBISPlugin-About__separator">сканирование документов</li><li class="SBISPlugin-About__separator">Отправка отчетности в ФСРАР</li><li> Удобной работы со своими документами, рамещенными в СБИС.Диске ("Документы/ Мои"), за счет механизма синхронизации файлов из облака с локальной папкой на компьютере </li><li class="SBISPlugin-About__separator"> Создания снимков экрана, а также их редактирования с помощью встроенного редактора изображений (см. вкладку "Скриншоты") </li></ul><div></div> Получить более детальную информацию по работе СБИС3 Плагин Вы можете на нашем <a href="https://help.sbis.ru/help/start/teh_terms/sbisplugin/" target="_blank">сайте поддержки</a> или позвонив нам по телефонам указанным на <a href="https://sbis.ru/contacts" target="_blank">данной</a> странице. <div class="SBISPlugin-About__separator"></div> Обсудить какие-либо возникшие вопросы или предложить новые возможности к реализации Вы можете посетив <a href="http://forum.sbis.ru/" target="_blank">форум</a> или отправив нам письмо. <div class="SBISPlugin-About__separator"></div> С наилучшими пожеланиями, команда разработчиков компании "Тензор". </div>'
            }

            // Отступ
            Item {
                height: 8;
                width: parent.width;
            }
        }
    }

    Scrollbar {
        id: scrollbar;

        flickableItem: flick;
        color: '#d9d9d9';

        positionOffset: 5;

        visible: mouseArea.containsMouse;
    }
}
