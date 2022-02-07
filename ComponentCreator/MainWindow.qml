import QtQuick 2.0
import Buttons 1.0
import QtQuick.Layouts 1.0
import Colors 1.1
Rectangle {
    color: CustomColors.secondary
    CustomButtonGroup{
        id: buttonGroup
        buttons: {
            let buttonList = [];
            for(let i = 0; i < columnLayout.children.length; i++){
                buttonList.push(columnLayout.children[i].radioButton);
            }
            return buttonList;
        }
        preselectionIndex: 0
    }

    ColumnLayout{
        id: columnLayout
        anchors.fill: parent
        anchors.leftMargin: 20

        CustomRadioTextButton{
            Layout.preferredHeight: 50
            Layout.preferredWidth: parent.width
            radioText.text: "Light theme"
            radioButton.onClicked: CustomColors.currentTheme = CustomColors.themes.light
        }
        CustomRadioTextButton{
            Layout.preferredHeight: 50
            Layout.preferredWidth: parent.width
            radioText.text: "Dark theme"
            radioButton.onClicked: CustomColors.currentTheme = CustomColors.themes.dark
        }
    }
}
