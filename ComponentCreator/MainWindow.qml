import QtQuick 2.0
import Buttons 1.0
import QtQuick.Layouts 1.0
import Colors 1.1
import Texts 1.0
import Fonts 1.0
Rectangle {
    ColumnLayout{
        anchors.fill: parent
        anchors.leftMargin: 15
        spacing: 15

        Item{ Layout.fillHeight: true; }

        CustomText{ text: "Text Thin"; font.family: CustomFonts.jsThin; }
        CustomText{ text: "Text Regular"; font.family: CustomFonts.jsRegular; }
        CustomText{ text: "Text Semi Bold"; font.family: CustomFonts.jsSemiBold; }
        CustomText{ text: "Text Bold"; font.family: CustomFonts.jsBold; }
        CustomText{ text: "Text Clickable"; clickable: true; onClicked: console.log("Clicked text!") }
        CustomText{ text: "Text with Tooltip"; tooltipEnabled: true; tooltipText: "Some text description!" }
        CustomText{ text: "Text with Tooltip & Clickable"; clickable: true; onClicked: console.log("Clicked text!"); tooltipEnabled: true; tooltipText: "Some text description!" }

        Item{ Layout.fillHeight: true; }
    }
}
