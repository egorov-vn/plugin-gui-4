import QtQuick 1.1
import ".."

Palette {
    inactive: PaletteValues {
        baseText: "black";
        headerText: "white";
		staticText: "white";
        fieldText: "#333399";
    }

    active: PaletteValues {
        baseText: "black";
        headerText: "white";
        staticText: "#333333";
        fieldText: "#333399";
    }

    disabled: PaletteValues {
        baseText: "black";
        headerText: "white";
		staticText: "#5F5F5F";
		fieldText: "#5F5F5F";
    }
}
