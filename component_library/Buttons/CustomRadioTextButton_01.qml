import QtQuick 2.0
import QtQuick.Layouts 1.3

import Fonts 1.0
import Texts 1.0

RowLayout{
    property alias radioButton: radioButton
    property alias radioText: radioText
    spacing: 15
    CustomRadioButton_01{
        id: radioButton
        Layout.preferredHeight: parent.height
        Layout.preferredWidth: height
    }
    CustomText{
        id: radioText
        text: "Radio button"
        font.pixelSize: 30
        Layout.fillWidth: true
        font.family: CustomFonts.jsBold
    }
}
