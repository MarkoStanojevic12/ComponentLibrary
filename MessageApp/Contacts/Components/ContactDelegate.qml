import QtQuick 2.15
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

import Colors 1.0
import Fonts 1.0

Rectangle {
    property var contactData: Users.get(index)

    color: "transparent"
    radius: 100

    Rectangle{
        id: hoverBackground
        height: parent.height
        width: mouseArea.containsMouse ? parent.width : 0
        Behavior on width { SmoothedAnimation{ duration: 450; } }
        anchors.left: parent.left; anchors.leftMargin: profileImage.width/2
        gradient: Gradient{
            orientation: Gradient.Horizontal
            GradientStop { position: 0.0; color: "transparent" }
            GradientStop { position: 0.4; color: CustomColors.highlight; }
            GradientStop { position: 0.8; color: "transparent" }
        }
    }

    RowLayout{
        width: parent.width * 0.9
        height: parent.height
        spacing: 8

        Image{
            id: profileImage
            source: imageURL
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: height
            asynchronous: true
            fillMode: Image.PreserveAspectCrop
            layer.enabled: true
            layer.effect: OpacityMask{
                maskSource: Item{
                    width: profileImage.width
                    height: profileImage.height
                    Rectangle{
                        anchors.centerIn: parent
                        width: Math.min(profileImage.width, profileImage.height)
                        height: width
                        radius: mainWindow.radius
                    }
                }
            }
        }

        ColumnLayout{
            Layout.fillWidth: true;
            Layout.preferredHeight: parent.height
            Layout.leftMargin: 8
            spacing: -2
            Layout.topMargin: -4

            Text{
                text: name + " " + lastName
                color: CustomColors.plainWhite
                font.pixelSize: 14
                Layout.fillWidth: true
                opacity: 0.8
                font.family: Poppins.bold
                Layout.fillHeight: true
                verticalAlignment: Qt.AlignBottom
            }
            Text{
                text: messages.count === 0 ? "" : messages.at(contactData.messages.count-1).contents
                color: CustomColors.plainWhite
                font.pixelSize: 12
                Layout.fillWidth: true
                opacity: 0.4
                font.family: Poppins.bold
                Layout.fillHeight: true
                verticalAlignment: Qt.AlignTop
                elide: Text.ElideRight
            }
        }
    }

    MouseArea{
        id: mouseArea
        hoverEnabled: true
        anchors.fill: parent
        onClicked: {
            Chat.openedChatUser = contactData;
            mainStack.push(openedChatView);
        }
    }
}
