import QtQuick 2.0

Item {
    Rectangle{
        color: "yellow"
        height: 200
        width: 400
        anchors.centerIn: parent

        Text{
            anchors.centerIn: parent
            text: "Hello Worldd!"
            font.pixelSize: 22
        }
    }
}
