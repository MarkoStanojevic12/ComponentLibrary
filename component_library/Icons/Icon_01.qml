import QtQuick 2.0
import QtGraphicalEffects 1.12

Image{
    id: icon

    property string color: ""
    property string path: ""

    fillMode: Image.PreserveAspectFit
    source: path

    layer{
        enabled: color != ""
        effect: ColorOverlay {
            color: icon.color
        }
    }
}
