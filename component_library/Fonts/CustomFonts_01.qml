import QtQuick 2.10

pragma Singleton

Item{
    readonly property string jsBold: jsBoldFont.name
    readonly property string jsRegular: jsRegularFont.name
    readonly property string jsSemiBold: jsSemiBoldFont.name
    readonly property string jsThin: jsThinFont.name

    FontLoader{ id: jsBoldFont; source: "./TTF/JosefinSans-Bold.ttf" }
    FontLoader{ id: jsRegularFont; source: "./TTF/JosefinSans-Regular.ttf" }
    FontLoader{ id: jsSemiBoldFont; source: "./TTF/JosefinSans-SemiBold.ttf" }
    FontLoader{ id: jsThinFont; source: "./TTF/JosefinSans-Thin.ttf" }
}
