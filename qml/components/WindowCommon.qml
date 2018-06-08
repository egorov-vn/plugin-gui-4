import QtQuick 1.1

Item {
    id: modalWindow;

    property string wTitle: "";
    property int    wWidth: 500;
    property int    wHeight: 150;
    property int    wX: parent.width/2 - wWidth/2;
    property int    wY: parent.height/2 - wHeight/2;

	property string wBackgroundColor: "#C0C0C0";

    property bool   wButtonOkShow: true;
	property string wButtonOkTitle: qsTr("OK");
    property bool   wButtonCancelShow: true;
    property string wButtonCancelTitle: qsTr("Cancel");

	signal pressOk();
	signal pressCancel();

    property Item item: loader.status == Loader.Ready ? loader.item : null;
    property Component  delegate;

	property Item content: null;

	onContentChanged: {
		content.parent = container;
	}

	anchors.fill: parent;

    // Background for Window
    Rectangle {
        id: windowBack;

        anchors.fill: parent;

        color: "gray";
        opacity: 0.5;
        visible: true;

        MouseArea {
            anchors.fill: parent;
        }
    }

    // Window
    Rectangle {
        id: window;

        width: wWidth;
        height: wHeight;

        x: wX;
        y: wY;

        opacity: 1;

        border.width: 2;
        border.color: "darkgray";
        radius: 5;
        smooth: true;

        Rectangle {
            width: parent.width - 2;
            height: parent.height - 2;

            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.verticalCenter: parent.verticalCenter;

            radius: 3;
            color: "#333333";

            Rectangle {
                id: modalTitle;

                width: parent.width;
                height: 40;

                gradient: Gradient {
                   GradientStop { position: 0.0; color: "#B8B8B8"; }
                   GradientStop { position: 1.0; color: "#333333"; }
                }

                MouseArea
                {
                	anchors.fill: parent;

					drag.target: window
					drag.filterChildren: true

	                Text {
	                    id: title;
	
	                    anchors.verticalCenter: parent.verticalCenter;
	                    anchors.horizontalCenter: parent.horizontalCenter;
	
	                    color: "white";
	                    font.pointSize: 12;
	                    font.bold: true;
	
	                    text: wTitle;
	                    
	                    MouseArea
	                    {
	                    	anchors.fill: parent
	                    }
	                }
				}

                Rectangle {

                    anchors.verticalCenter: parent.verticalCenter;
                    anchors.left: parent.left;
                    anchors.leftMargin: 10;
                    width: 80;

					Button {
                        width: 80;
                        height: 28;
                        visible: wButtonCancelShow;

                        anchors.left: parent.left;
                        anchors.leftMargin: 10;
                        anchors.verticalCenter: parent.verticalCenter;

						text: wButtonCancelTitle;

						color: main.palette.inactive.headerText;

						gradient: Gradient {
							GradientStop { position: 0.0; color: "#B8B8B8"; }
							GradientStop { position: 1.0; color: "#333333"; }
						}

						border: {
							"width": 1,
							"color": "#A9A9A9"
						}

                        onClicked: {
							modalWindow.pressCancel();
                        }
                    }
                }
	
                Rectangle {

                    anchors.verticalCenter: parent.verticalCenter;
                    anchors.right: parent.right;
                    anchors.rightMargin: 10;
                    width: 80;

					Button {
                        width: 80;
                        height: 28;
                        visible: wButtonOkShow;

                        anchors.right: parent.right;
                        anchors.rightMargin: 10;
                        anchors.verticalCenter: parent.verticalCenter;

						text: wButtonOkTitle;

						color: main.palette.inactive.headerText;

						gradient: Gradient {
							GradientStop { position: 0.0; color: "#B8B8B8"; }
							GradientStop { position: 1.0; color: "#333333"; }
						}

						border: {
							"width": 1,
							"color": "#A9A9A9"
						}

                        onClicked: {
							modalWindow.pressOk();
                        }
                    }
				}
            }

            Rectangle {
                id: modalBody;

                width: parent.width - 20;
                height: parent.height - modalTitle.height - 10;

                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.top: parent.top;
                anchors.topMargin: modalTitle.height;

                border.width: 2;
                border.color: "darkgray";
                radius: 5;
                smooth: true;

                color: wBackgroundColor;

                clip: true;

                Loader {
                    id: loader;
                	
                    anchors.fill: parent;

                    sourceComponent: delegate;
                }

                Item {
                    id: container;

                    visible: container.children.length > 0;

                    anchors.fill: parent;
                }
            }
        }
    }
    // Rectangle Window
}
