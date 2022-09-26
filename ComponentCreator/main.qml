import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 1000
    height: 640
    visible: true
    title: qsTr("Hello World")

    Loader{
        id: mainLoader
        anchors.fill: parent

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
