import QtQuick 1.1

Item {
	id: scrollbar;

	property Flickable flickableItem: null;

	property int  orientation: Qt.Vertical;
	property alias color: slider.color;

    /**
     * Отступ от списка элементов (отрицательный - скрол сбоку, положительный - скрол на списке)
     */
    property int positionOffset: -12;

    property bool interactive: true;

	signal flickEnded();

	anchors.fill: flickableItem;

	// Invisible slider - real slider based on yPosition and heightRatio
	Item {
		id: invisibleSlider;

		anchors.right: orientation == Qt.Vertical ? parent.right : undefined;
        anchors.rightMargin: orientation == Qt.Vertical ? positionOffset : 0;

		anchors.bottom: orientation == Qt.Horizontal ? parent.bottom : undefined;
        anchors.bottomMargin: orientation == Qt.Horizontal ? positionOffset : 0;

		x: orientation == Qt.Vertical ? 1 : internals.position * scrollbar.width;
		y: orientation == Qt.Vertical ? internals.position * scrollbar.height : 1;

		width: orientation == Qt.Vertical
			? internals.scrollWidth
			: internals.hasScrollableContent() ? internals.pageSize * scrollbar.width : 0;
		height: orientation == Qt.Vertical
			? internals.hasScrollableContent() ? internals.pageSize * scrollbar.height : 0
			: internals.scrollWidth;
	}

	// Wrapper for invisible slider
	Rectangle {
		id: slider;

		anchors.right: orientation == Qt.Vertical ? parent.right : undefined;
        anchors.rightMargin: orientation == Qt.Vertical ? positionOffset : 0;

		anchors.bottom: orientation == Qt.Horizontal ? parent.bottom : undefined;
        anchors.bottomMargin: orientation == Qt.Horizontal ? positionOffset : 0;

        radius: internals.radius;

		x: orientation == Qt.Vertical
			? 1
			: internals.pageSize * scrollbar.width < internals.scrollHeight
				? invisibleSlider.x - (invisibleSlider.x + invisibleSlider.width) / scrollbar.width * (internals.scrollHeight - invisibleSlider.width)
				: invisibleSlider.x;

		y: orientation == Qt.Vertical
			? internals.pageSize * scrollbar.height < internals.scrollHeight
				? invisibleSlider.y - (invisibleSlider.y + invisibleSlider.height) / scrollbar.height * (internals.scrollHeight - invisibleSlider.height)
				: invisibleSlider.y
			: 1;

		width: orientation == Qt.Vertical
			? internals.scrollWidth
			: internals.pageSize * scrollbar.width < internals.scrollHeight ? internals.scrollHeight : invisibleSlider.width;

		height: orientation == Qt.Vertical
			? internals.pageSize * scrollbar.height < internals.scrollHeight ? internals.scrollHeight : invisibleSlider.height
			: internals.scrollWidth;

		color: "#5678de";
		opacity: orientation == Qt.Vertical
			? (flickableItem.contentHeight > flickableItem.height ? 0.5 : 0)
			: (flickableItem.contentWidth > flickableItem.width ? 0.5 : 0);


		MouseArea {
			anchors.fill: parent;
			anchors.leftMargin: -8;
			anchors.rightMargin: -8;

			property int deltaX;
			property int deltaY;

			enabled: scrollbar.interactive;

			onPressed: {
				if (orientation == Qt.Horizontal)
				{
                    parent.anchors.bottomMargin = positionOffset < 0 ? positionOffset - 3 : positionOffset - 2;
                    parent.height = internals.scrollWidthHover;
				}

				if (orientation == Qt.Vertical)
				{
                    parent.anchors.rightMargin = positionOffset < 0 ? positionOffset - 3 : positionOffset - 2;
                    parent.width = internals.scrollWidthHover;
				}

                parent.radius = internals.radiusHover;
				parent.opacity = 1;
			}

			onPositionChanged: {
				if ( deltaX == 0 ) { deltaX = mouseX; }
				if ( deltaY == 0 ) { deltaY = mouseY; }

				if (orientation == Qt.Horizontal)
				{
					flickableItem.contentX = flickableItem.contentX + (mouseX - deltaX) / internals.pageSize;

					if (parent.x + parent.width >= scrollbar.width)
					{
						flickableItem.contentX = flickableItem.contentWidth - scrollbar.width;

						scrollbar.flickEnded();
					}
					if (parent.x <= 0)
					{
						flickableItem.contentX = 0;
					}
				}

				if (orientation == Qt.Vertical)
				{
					flickableItem.contentY = flickableItem.contentY + (mouseY - deltaY) / internals.pageSize;

					if (parent.y + parent.height >= scrollbar.height)
					{
						flickableItem.contentY = flickableItem.contentHeight - scrollbar.height;

						scrollbar.flickEnded();
					}
					if (parent.y <= 0)
					{
						flickableItem.contentY = 0;
					}
				}
			}

			onReleased: {
				if (orientation == Qt.Horizontal)
				{
                    parent.anchors.bottomMargin = positionOffset;
					parent.height = internals.scrollHeight;
				}

				if (orientation == Qt.Vertical)
				{
                    parent.anchors.rightMargin = positionOffset;
					parent.width = internals.scrollWidth;
				}

                parent.radius = internals.radius;
				parent.opacity = 0.5;

				deltaX = 0;
				deltaY = 0;
			}
		}
	}

	states: State {
		name: "shown";
		when: orientation == Qt.Vertical && flickableItem.movingVertically && flickableItem.contentHeight > flickableItem.height
			|| orientation == Qt.Horizontal && flickableItem.movingHorizontally && flickableItem.contentWidth > flickableItem.width;

		PropertyChanges {
			target: slider;
			opacity: 1;
		}
	}

	transitions: Transition {
		NumberAnimation { properties: "opacity"; duration: 400; }
	}

	QtObject {
		id: internals;

        property int scrollWidth: 4;
        property int scrollWidthHover: 8;

        property int radius: 2;
        property int radiusHover: 4;

        property int scrollHeight: 40;

		property real position: orientation == Qt.Vertical ? flickableItem.visibleArea.yPosition : flickableItem.visibleArea.xPosition;
		property real pageSize: orientation == Qt.Vertical ? flickableItem.visibleArea.heightRatio : flickableItem.visibleArea.widthRatio;

		function hasScrollableContent() {
			if (!flickableItem)
				return false;

			var ratio = orientation == Qt.Vertical ? flickableItem.visibleArea.heightRatio : flickableItem.visibleArea.widthRatio;

			return ratio > 0 && ratio < 1.0;
		}
	}
}
