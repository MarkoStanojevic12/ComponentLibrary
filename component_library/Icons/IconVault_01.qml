import QtQuick 2.0

pragma Singleton

QtObject{
    readonly property string svgPath: "./media/svg/"

    readonly property string android: svgPath + "android.svg"
    readonly property string apple: svgPath + "apple.svg"

    readonly property string arrowLeft: svgPath + "arrowLeft.svg"
    readonly property string send: svgPath + "send.svg"
    readonly property string options: svgPath + "options.svg"
    readonly property string search: svgPath + "search.svg"

}
