import QtQuick 2.0
import QtQuick.Layouts 1.3

RowLayout{
    property alias radioButton: radioButton
    property alias radioText: radioText
    spacing: 15
    CustomRadioButton_01{
        id: radioButton
        Layout.preferredHeight: parent.height
        Layout.preferredWidth: height
    }
    Text{
        id: radioText
        text: "Radio button"
        font.pixelSize: 30
        Layout.fillWidth: true
    }
}
