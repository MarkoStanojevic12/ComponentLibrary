pragma Singleton

import QtQuick 2.9

Item{
    QtObject{
        id: themes
        readonly property var light: ["#F3C892", "#FFF1BD", "#A3DA8D", "#146356"]
        readonly property var dark: ["#040303", "#461111", "#A13333", "#B3541E"]
    }
    property var currentTheme: themes.light
    property alias themes: themes

    readonly property string primary: currentTheme[0]
    readonly property string secondary: currentTheme[1]
    readonly property string tertiary: currentTheme[2]
    readonly property string quaternary: currentTheme[3]
}
