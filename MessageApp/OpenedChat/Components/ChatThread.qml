import QtQuick 2.15

Item {
    anchors.left: parent.left; anchors.right: parent.right;
    anchors.bottom: chatInput.top; anchors.top: parent.top;

    ListView{
        id: openedChatList
        anchors.fill: parent
        anchors.margins: 16
        model: Chat.openedChatUser.messages

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

    }
}
