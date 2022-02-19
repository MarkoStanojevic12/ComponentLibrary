import QtQuick 2.12
import QtQuick.Controls 2.5

Text{
    id: textRoot

    property bool clickable: false
    property bool containsMouse

    property bool tooltipEnabled: false
    property string tooltipText: text

    signal clicked

    ToolTip.text: tooltipText
    ToolTip.visible: tooltipText != "" && tooltipEnabled && containsMouse

    font.pixelSize: 20

    Loader{
        id: mouseAreaLoader
        anchors.fill: parent
        sourceComponent: mouseAreaComponent
        active: textRoot.clickable || textRoot.tooltipEnabled
    }
    Component{
        id: mouseAreaComponent
        MouseArea{
            id: mouseArea
            hoverEnabled: true
            cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
            onClicked: {
                if(textRoot.clickable)
                    textRoot.clicked();
            }
            onContainsMouseChanged: textRoot.containsMouse = containsMouse;
        }
    }
}
