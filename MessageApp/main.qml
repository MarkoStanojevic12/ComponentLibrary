import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 336
    height: 725
    visible: true
    title: qsTr("Message App")
    color: "transparent"

    flags: Qt.WindowStaysOnTopHint

    Loader{
        id: mainLoader
        anchors.fill: parent
        anchors.margins: 0
        source: "./MainWindow.qml"

        function reload(){
            mainLoader.source = "";
            QmlEngine.clearCache();
            mainLoader.source = "./MainWindow.qml"
        }
    }

    Connections{
        target: QmlEngine

        function onReloadUI(){
            console.log("Reloading UI");
            mainLoader.reload();
        }
    }
}
