import QtQuick 2.15

import Colors 1.0

import "./Components"

Component{
    Rectangle {
        gradient: Gradient{
            orientation: Gradient.Horizontal
            GradientStop{ position: 0.0; color: CustomColors.backgroundDark; }
            GradientStop{ position: 1.0; color: CustomColors.backgroundLight; }
        }
        radius: mainWindow.radius
        ChatHeader{ id: chatHeader; }
        Rectangle{
            id: chatBody
            width: parent.width
            anchors.bottom: parent.bottom
            height: parent.height * 0.89
            radius: 40
            color: CustomColors.primary

            ChatThread{ id: chatThread; }
            ChatInput{ id: chatInput; }
        }
    }
}
