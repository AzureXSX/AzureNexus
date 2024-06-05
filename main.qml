import QtQuick
import QtQuick.Controls
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Button {
        text: "Connect"
        onClicked: screenCapture.takeScreenShot()
        background: Rectangle {
            width: parent.width
            height: parent.height
            gradient: Gradient {
                GradientStop { position: 0.0; color: "lightblue" }
                GradientStop { position: 1.0; color: "darkblue" }
            }
            radius: 10
        }
    }
}
