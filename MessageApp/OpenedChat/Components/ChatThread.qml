import QtQuick 2.15

Item {
    anchors.left: parent.left; anchors.right: parent.right;
    anchors.bottom: chatInput.top; anchors.top: parent.top;

    property alias chat: chatHistory
    ListView{
        id: openedChatList
        anchors.fill: parent
        anchors.margins: 16
        model: chatHistory

        spacing: 8
        clip: true
        highlightFollowsCurrentItem: true

        onCountChanged: {
            openedChatList.currentIndex = count - 1;
        }

        delegate: ChatBubble{}

        add: Transition{
            NumberAnimation{ properties: "x"; from: openedChatList.width/2; duration: 1500; easing.type: Easing.OutBounce; }
        }

        ListModel {
            id: chatHistory
            ListElement { sender: true; message: "Hey, what's up"; time: "01:15"; }
            ListElement { sender: true; message: "Did you watch the game last night?"; time: "01:15" }
            ListElement { sender: false; message: "Yeah, it was wild!"; time: "01:16" }
            ListElement { sender: false; message: "Couldn't sleep for hours after that..."; time: "01:17" }
            ListElement { sender: true; message: "I feel you man..."; time: "01:18" }
        }
    }
}
