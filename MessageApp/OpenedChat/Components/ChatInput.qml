import QtQuick 2.15
import QtQuick.Controls 2.5

import Colors 1.0
import Fonts 1.0
import Icons 1.0
import Buttons 1.0

Rectangle {
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 15
    anchors.horizontalCenter: parent.horizontalCenter

    height: 55
    width: parent.width * 0.87
    radius: 100

    gradient: Gradient {
        orientation: Gradient.Horizontal
        GradientStop { position: -0.2; color: CustomColors.darkBubbleLeft; }
        GradientStop { position: 1.0; color: CustomColors.darkBubbleRight; }
    }

    TextArea{
        id: messageField
        anchors.left: parent.left
        anchors.right: sendButton.left
        anchors.margins: 10
        height: parent.height
        verticalAlignment: Qt.AlignVCenter
        clip: true
        wrapMode: TextArea.Wrap
        placeholderText: qsTr("Type your message here...")

        color: CustomColors.plainWhite
        font.pixelSize: 12
        opacity: 0.7
        font.family: Poppins.bold
        selectByMouse: true
    }

    IconButton{
        id: sendButton

        height: parent.height * 0.8
        width: height
        anchors.right: parent.right; anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 8
        icon.color: CustomColors.plainWhite
        icon.path: IconVault.send
        icon.sourceSize.height: height * 0.45
        icon.anchors.leftMargin: 10

        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop { position: -0.4; color: CustomColors.lightBubbleLeft; }
            GradientStop { position: 1.0; color: CustomColors.lightBubbleRight; }
        }
        onClicked: sendMessage();
    }

    Shortcut{
        sequence: visible ? "Ctrl+Return" : ""
        onActivated: sendMessage();
    }

    function sendMessage(){
        if(messageField.text == "")
            return;

        Chat.sendMessage(messageField.text);
        messageField.text = "";
    }
}
