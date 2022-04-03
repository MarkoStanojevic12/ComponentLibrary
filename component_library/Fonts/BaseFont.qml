import QtQuick 2.10

Item{
    property string fontName

    readonly property string bold: boldFont.name
    readonly property string semiBold: semiBoldFont.name
    readonly property string medium: mediumFont.name
    readonly property string light: lightFont.name
    readonly property string extraLight: extraLightFont.name

    readonly property string basePath: "./TTF/" + fontName + "/" + fontName

    FontLoader{ id: boldFont; source: basePath + "-Bold.ttf"; }
    FontLoader{ id: semiBoldFont; source: basePath + "-SemiBold.ttf" }
    FontLoader{ id: mediumFont; source: basePath + "-Medium.ttf" }
    FontLoader{ id: lightFont; source: basePath + "-Light.ttf" }
    FontLoader{ id: extraLightFont; source: basePath + "-ExtraLight.ttf" }
}
