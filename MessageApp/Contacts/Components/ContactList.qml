import QtQuick 2.15
import QtQuick.Layouts 1.3

import Colors 1.0
import Fonts 1.0
Item {
    height: parent.height * 0.85
    width: parent.width
    anchors.bottom: parent.bottom

    Rectangle{
        anchors.fill: parent
        color: "#141414"
        opacity: 0.5
        radius: 40
    }

    Rectangle{
        id: notch
        width: parent.width * 0.1
        height: 5
        radius: 100
        color: "#5E6777"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top; anchors.topMargin: 6
    }

    Item{
        anchors.top: notch.bottom
        anchors.topMargin: 24
        anchors.bottom: parent.bottom
        anchors.left: parent.left; anchors.right: parent.right;
        anchors.margins: 22

        RowLayout{
            id: titleLayout
            width: parent.width
            Text{
                text: qsTr("Recent Chat")
                color: CustomColors.plainWhite
                font.pixelSize: 16
                font.family: Poppins.semiBold
                font.bold: true
                opacity: 0.75
            }
        }

        ListView{
            id: contactsListView
            anchors.top: titleLayout.bottom; anchors.topMargin: 22
            anchors.bottom: parent.bottom
            width: parent.width
            spacing: 18
            clip: true
            model: Users.users
            delegate: ContactDelegate{
                height: 65
                width: contactsListView.width
            }
        }
    }
}
