import QtQuick 2.0
import Buttons 1.0
import QtQuick.Layouts 1.0

Item {
    CustomButtonGroup{
        id: buttonGroup
        buttons: {
            let buttonList = [];
            for(let i = 0; i < columnLayout.children.length; i++){
                buttonList.push(columnLayout.children[i].radioButton);
            }
            return buttonList;
        }
        preselectionIndex: 1
    }

    ColumnLayout{
        id: columnLayout
        anchors.fill: parent
        anchors.leftMargin: 20

        CustomRadioTextButton{
            Layout.preferredHeight: 50
            Layout.preferredWidth: parent.width
        }
        CustomRadioTextButton{
            Layout.preferredHeight: 50
            Layout.preferredWidth: parent.width
        }
        CustomRadioTextButton{
            Layout.preferredHeight: 50
            Layout.preferredWidth: parent.width
        }
    }
}
