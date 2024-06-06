import QtQuick
import QtQuick.Controls
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
        onClicked: voiceCapture.start()
    }
    Button{
        text: "stop"
        onClicked: voiceCapture.stop()
        x: 300
    }
}
