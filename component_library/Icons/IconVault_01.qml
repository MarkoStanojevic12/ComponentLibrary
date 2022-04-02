import QtQuick 2.0

pragma Singleton

QtObject{
    readonly property string svgPath: "./media/svg/"

    readonly property string android: svgPath + "android.svg"
    readonly property string apple: svgPath + "apple.svg"
}
