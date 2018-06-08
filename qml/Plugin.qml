import QtQuick 1.1
import 'components'
import 'themes'
import 'Plugin'

Item {
	id: main;

    property string  theme: 'qrc:/qml/themes/online';
    property variant palette: Qt.createComponent(main.theme + '/Palette.qml').createObject(main);

    FontLoader {
        id: sbisMobileIcons;
        source: 'qrc:/resources/fonts/sbis-mobile-icons.ttf';

        property string menu:               status == FontLoader.Ready ? '\ue948' : '';
        property string menuMessages:       status == FontLoader.Ready ? '\ue93c' : '';
        property string task:               status == FontLoader.Ready ? '\ue945' : '';
        property string menuNews:           status == FontLoader.Ready ? '\ue936' : '';
        property string paperPlane:         status == FontLoader.Ready ? '\ue953' : '';
        property string surveyors:          status == FontLoader.Ready ? '\uea13' : '';
        property string menuRequirements:   status == FontLoader.Ready ? '\ue97e' : '';
        property string envelope:           status == FontLoader.Ready ? '\ue960' : '';
        property string menuNotifications:  status == FontLoader.Ready ? '\ue93d' : '';
        property string settingsBlack:      status == FontLoader.Ready ? '\ue928' : '';
    }

    FontLoader {
        id: sbisIcons;
        source: 'qrc:/resources/fonts/cbuc-icons.ttf';

        property string successful:         status == FontLoader.Ready ? '\ue616' : '';
        property string tfNewTab:           status == FontLoader.Ready ? '\ue746' : '';
        property string outHotel:           status == FontLoader.Ready ? '\ue765' : '';
        property string closeButton:        status == FontLoader.Ready ? '\u200b' : '';
        property string markCRightLight:    status == FontLoader.Ready ? '\ue9ab' : '';

        property string settings:           status == FontLoader.Ready ? '\ue61b' : '';
        property string tFNetwork:          status == FontLoader.Ready ? '\ue744' : '';
        property string admin2:             status == FontLoader.Ready ? '\ue760' : '';
        property string info:               status == FontLoader.Ready ? '\ue64b' : '';

        property string bell:               status == FontLoader.Ready ? '\ue69b' : '';

        property string checked:            status == FontLoader.Ready ? '\ue616' : '';
    }

    width: 500;
    height: 600;

    property bool isAuth: false;

    function authenticateByPassword(login, password) {
        main.isAuth = true;
       //main.
    }

    function authenticateByCert() {
        main.isAuth = true;
    }

    function logout() {
        main.isAuth = false;
    }

    PageAuth {
		id: winAuth;

        visible: !isAuth;
	}

    PageNotices {
        id: winNotices;

        visible: isAuth;
    }

    /*
    PageNotice {
        id: winNotice;

        visible: false;
    }

    Rectangle {
        anchors.bottom: parent.bottom;
        anchors.right: parent.right;
        anchors.bottomMargin: 40;
        anchors.rightMargin: 40;
        color: 'yellow';
        height: 80;
        width: 80;

        MouseArea {
            anchors.fill: parent;

            onClicked: {
                winAuth.visible = false;
                winNotices.visible = false;
                main.height = 100;
                winNotice.visible = true;
            }
        }
    }
    */
}
