import QtQuick 2.0
import Colors 1.1
import Icons 1.0

Rectangle{
    id: buttonRoot
    color: CustomColors.primary
    radius: 100
    opacity: mouseArea.containsMouse ? 0.8 : 1

    signal clicked

    property alias icon: icon

    Icon{
        id: icon
        sourceSize.height: parent.height * 0.3
        anchors.centerIn: parent
        path: IconVault.android
    }

    MouseArea{
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            buttonRoot.clicked();
        }
        cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
    }
}
