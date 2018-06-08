import QtQuick 1.1

StyledItem {
    id: actionItem

	property Item action: null;		// Item must be Action type (in QtQuick 1.1 this impossible, action can't be null)

	visible: action ? action.visible : true;
	enabled: action ? action.enabled : true;

	property string text: action ? action.text : "";

	property url iconSource: action ? action.iconSource : iconName;

	property string iconName: action ? action.iconName : "";

	signal triggered(variant value);

	onTriggered: if (action) action.trigger(value);

    function trigger(value) {
		var passingValue = value ? value : null;
        if (actionItem.enabled) actionItem.triggered(passingValue);
    }
}
