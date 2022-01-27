import QtQuick 2.0

Rectangle{
    id: outerCircle
    color: "transparent"
    border.width: 2
    border.color: "blue"
    radius: 100
    opacity: mouseArea.containsMouse ? 0.5 : 1

    property bool checked: false
    property bool customCheckBehaviour: false

    signal clicked

    Rectangle{
        id: innerCircle
        visible: outerCircle.checked
        anchors.centerIn: parent
        height: outerCircle.height * 0.65
        width: height
        color: outerCircle.border.color
        radius: outerCircle.radius
    }

    MouseArea{
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            if(!customCheckBehaviour)
                outerCircle.checked = !outerCircle.checked
            outerCircle.clicked();
        }
        cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
    }
}
