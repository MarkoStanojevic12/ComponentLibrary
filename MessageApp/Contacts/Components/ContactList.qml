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
            model: contacts
            delegate: ContactDelegate{
                height: 65
                width: contactsListView.width
            }
            ListModel {
                id: contacts
                ListElement { name: "Marko Stanojevic"; imageURL: "../../Media/Images/Marko.jpg"; lastMessage: "I feel you man..."; }
                ListElement { name: "Mom"; imageURL: "../../Media/Images/avatar.jpg"; lastMessage: "Did you finish your supper?"; }
                ListElement { name: "Leonardo DiCaprio"; imageURL: "../../Media/Images/Leonardo_DiCaprio.png"; lastMessage: "Global warming is getting more serious by the day!"; }
                ListElement { name: "Elon Musk"; imageURL: "../../Media/Images/Elon_Musk.jpg"; lastMessage: "Let's build a rocket!!"; }
                ListElement { name: "Dad"; imageURL: "../../Media/Images/avatar.jpg"; lastMessage: "Are ya winning son?"; }
                ListElement { name: "Simon Sinek"; imageURL: "../../Media/Images/Simon_Sinek.jpg"; lastMessage: "I've seen this one... Inspiring stuff!"; }
                ListElement { name: "Felix Kjellberg"; imageURL: "../../Media/Images/Pewds.jpg"; lastMessage: "Let's play some minecraft, new update launched!"; }
                ListElement { name: "Novak Djokovic"; imageURL: "../../Media/Images/Novak_Djokovic.jpg"; lastMessage: "Gde si kralju he he"; }
            }
        }
    }
}
