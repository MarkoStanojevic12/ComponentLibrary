import QtQuick 2.15
import Buttons 1.0
import QtQuick.Layouts 1.0
import Colors 1.1
import Texts 1.0
import Fonts 1.0
import Icons 1.0

Rectangle {
    gradient: Gradient {
        orientation: Gradient.Horizontal
        stops:[
            GradientStop { position: 0.0; color: "#000000" },
            GradientStop { position: 1.0; color: "#323232" }
        ]
    }


}
