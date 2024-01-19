import QtQuick 2.15
import QtQuick.Controls 2.5

import Colors 1.0
import Fonts 1.0

Item {
    height: shouldShowTime ? bubble.height + 25 : bubble.height
    width: bubble.width
    x: sender ? 0 : openedChatList.width - width

    readonly property bool sender: userID == Chat.mainUser.ID
    property bool shouldShowTime: openedChatList.count - 1 === index ? true : openedChatList.model.at(index+1).userID !== Chat.mainUser.ID

    Rectangle{
        id: bubble
        width: Math.min(messageText.implicitWidth + 24, (openedChatList.width * 0.8))
        height: messageText.implicitHeight + 24
        radius: 12

        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop { position: -0.2; color: sender ? CustomColors.darkBubbleLeft : CustomColors.lightBubbleLeft; }
            GradientStop { position: 1.0; color: sender ? CustomColors.darkBubbleRight : CustomColors.lightBubbleRight; }
        }

        Text{
            id: messageText
            text: contents
            anchors.fill: parent
            anchors.margins: 12
            wrapMode: Label.Wrap
            color: CustomColors.plainWhite
            opacity: 0.75
            font.pixelSize: 12
            font.family: Poppins.medium
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: sender ? Qt.AlignLeft : Qt.AlignRight
        }
    }
    Text{
        anchors.top: bubble.bottom; anchors.topMargin: 10
        anchors.right: sender ? undefined : parent.right
        horizontalAlignment: sender ? Qt.AlignLeft : Qt.AlignRight
        text: time
        width: bubble.width
        height: 20
        color: CustomColors.plainWhite
        font.pixelSize: 10
        visible: shouldShowTime
        opacity: 0.3
        font.family: Poppins.medium
    }
}
