import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.12

import Fonts 1.0
import Buttons 1.0
import Colors 1.0
import Icons 1.0

Item {
    anchors.top: parent.top
    anchors.bottom: chatBody.top
    anchors.topMargin: 16; anchors.bottomMargin: 16;
    anchors.leftMargin: 22; anchors.rightMargin: 22
    anchors.left: parent.left; anchors.right: parent.right;

    RowLayout{
        anchors.fill: parent
        spacing: 8
        IconButton{
            id: backButton
            Layout.preferredHeight: parent.height * 0.91
            Layout.preferredWidth: height
            color: CustomColors.primary
            icon.color: CustomColors.plainWhite
            icon.path: IconVault.arrowLeft
            onClicked: mainStack.pop();
        }
        Item{ Layout.fillWidth: true; }
        Image{
            id: background
            property bool adapt: true
            source: "../../Media/Images/Marko.jpg"
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: height
            asynchronous: true
            fillMode: Image.Stretch
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Item {
                    width: background.width
                    height: background.height
                    Rectangle {
                        anchors.centerIn: parent
                        width: background.adapt ? background.width : Math.min(background.width, background.height)
                        height: background.adapt ? background.height : width
                        radius: mainWindow.radius
                    }
                }
            }
        }
        ColumnLayout{
            Layout.preferredWidth: parent.width*0.4
            Layout.preferredHeight: parent.height * 0.8
            Layout.alignment: Qt.AlignVCenter
            spacing: -2
            Text{
                text: "Marko Stanojevic"
                color: CustomColors.plainWhite
                font.pixelSize: 14
                font.family: Poppins.medium
                Layout.fillHeight: true;
                Layout.preferredWidth: parent.width
                elide: Text.ElideRight
            }
            Text{
                text: "Online"
                color: CustomColors.plainWhite
                font.pixelSize: 12
                opacity: 0.35
                font.family: Poppins.medium
                Layout.fillHeight: true;
                Layout.preferredWidth: parent.width
                elide: Text.ElideRight
            }
        }
        Item{ Layout.fillWidth: true; }
        IconButton{
            id: optionsButton
            Layout.preferredHeight: parent.height * 0.91
            Layout.preferredWidth: height
            color: CustomColors.primary
            icon.color: CustomColors.plainWhite
            icon.path: IconVault.options
        }
    }
}
