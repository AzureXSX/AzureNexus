import QtQuick
import QtQuick.Controls
import QtWayland.Compositor

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color:  "#1c1f24"

    TextInput {
        width: 200
        height: 70
        color: "white"
    }
    Button{
        text: "start"
        onClicked: captureX.init()
    }
    Button{
        text: "stop"
        onClicked: screenCapture.takeScreenShot()
        x: 300
    }
}
