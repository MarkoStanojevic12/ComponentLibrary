import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {
    color: "transparent"
    anchors.fill: parent
    radius: mainWindow.radius
    Image{
        id: background
        anchors.fill: parent
        source: "../../Media/Images/background.png"
        asynchronous: true
        fillMode: Image.Stretch

        layer.enabled: true
        layer.effect: OpacityMask{
            maskSource: Item{
                width: background.width
                height: background.height
                Rectangle{
                    anchors.centerIn: parent
                    width: background.width
                    height: background.height
                    radius: mainWindow.radius
                }
            }
        }
    }
}
