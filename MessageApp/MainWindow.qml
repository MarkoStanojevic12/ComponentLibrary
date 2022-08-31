import QtQuick 2.0
import QtQuick.Controls 2.5

import "./Contacts"
import "./OpenedChat"

Rectangle {
    id: mainWindow
    color: "transparent"
    radius: 50

    StackView{
        id: mainStack
        anchors.fill: parent
        initialItem: contactsView
    }

    ContactsView{ id: contactsView; }
    OpenedChatView{ id: openedChatView; }
}
