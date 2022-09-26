import QtQuick 2.0
import QtQuick.Layouts 1.3

import Colors 1.0
import Fonts 1.0
import Buttons 1.0
import Icons 1.0

Item {
    anchors.top: parent.top
    anchors.bottom: contactList.top
    anchors.left: parent.left; anchors.right: parent.right
    anchors.margins: 14

    RowLayout{
        anchors.left: parent.left; anchors.right: parent.right
        anchors.top: parent.top; anchors.bottom: parent.bottom;
        anchors.margins: 8;
        anchors.topMargin: 10
        anchors.bottomMargin: 24
        spacing: 10

        ColumnLayout{
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 0

            Text{
                text: qsTr("Good Morning") + ","
                color: CustomColors.plainWhite
                font.pixelSize: 12
                Layout.fillWidth: true
                opacity: 0.4
                font.family: Poppins.bold
                Layout.topMargin: 4
            }
            Text{
                text: Chat.mainUser.name + " " + Chat.mainUser.lastName
                color: CustomColors.plainWhite
                font.pixelSize: 16
                Layout.fillWidth: true
                opacity: 0.8
                font.family: Poppins.bold
                lineHeight: 0.5
            }
        }

        IconButton{
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: height
            color: CustomColors.primary
            icon.color: CustomColors.plainWhite
            icon.path: IconVault.search
        }
        IconButton{
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: height
            color: CustomColors.primary
            icon.color: CustomColors.plainWhite
            icon.path: IconVault.options
        }
    }
}
