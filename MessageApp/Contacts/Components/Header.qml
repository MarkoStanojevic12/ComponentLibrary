import QtQuick 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5

import Colors 1.0
import Fonts 1.0
import Buttons 1.0
import Icons 1.0

Item {
    id: headerRoot
    anchors.top: parent.top
    anchors.bottom: contactList.top
    anchors.left: parent.left; anchors.right: parent.right
    anchors.margins: 14

    property bool searchToggled: false
    onSearchToggledChanged: console.log("Search toggle state:", searchToggled)

    RowLayout{
        anchors.left: parent.left; anchors.right: parent.right
        anchors.top: parent.top; anchors.bottom: parent.bottom;
        anchors.margins: 8;
        anchors.topMargin: 10
        anchors.bottomMargin: 24
        spacing: 10

        ColumnLayout{
            id: welcomingLayout
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 0

            states: [
                State{
                    name: "INVISIBLE"
                    when: headerRoot.searchToggled
                    PropertyChanges{ target: welcomingLayout; opacity: 0; }
                },
                State{
                    name: "VISIBLE"
                    when: true
                    PropertyChanges{ target: welcomingLayout; opacity: 1; }
                }
            ]
            transitions: Transition{
                NumberAnimation{ properties: "opacity"; duration: 1300; easing.type: welcomingLayout.state == "VISIBLE" ? Easing.InExpo : Easing.OutExpo; }
            }

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
            id: searchButton
            readonly property bool isMaximized: searchButton.width == parent.width - optionsButton.width - parent.spacing*3
            readonly property bool isMinimized: searchButton.width == searchButton.height

            onIsMaximizedChanged: if(isMaximized){ searchArea.forceActiveFocus(); }
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: headerRoot.searchToggled ? parent.width - optionsButton.width - parent.spacing*3 : height
            color: CustomColors.primary
            icon.color: CustomColors.plainWhite
            icon.path: IconVault.search

            onClicked: headerRoot.searchToggled = !headerRoot.searchToggled

            Behavior on Layout.preferredWidth { SmoothedAnimation{ duration: 1000; easing.type: Easing.OutExpo; } }

            icon.anchors.left: icon.parent.left
            icon.anchors.leftMargin: 14
            icon.anchors.centerIn: isMinimized ? icon.parent : undefined

            TextArea{
                id: searchArea
                height: parent.height
                anchors.left: searchButton.icon.right
                anchors.right: parent.right
                anchors.margins: 16

                color: CustomColors.plainWhite
                verticalAlignment: Qt.AlignVCenter
                selectByMouse: true
                placeholderText: qsTr("Search...")
                clip: true
                wrapMode: Text.WrapAnywhere

                onTextChanged: Users.setFilterFixedString(text)

                Shortcut{
                    sequence: searchButton.isMaximized ? "Esc" : ""
                    onActivated: headerRoot.searchToggled = false;
                }
            }
        }
        IconButton{
            id: optionsButton
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: height
            color: CustomColors.primary
            icon.color: CustomColors.plainWhite
            icon.path: IconVault.options
        }
    }
}
