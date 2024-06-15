import QtQuick
import QtQuick.Controls
import QtWayland.Compositor
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color:  "#1c1f24"
    id: reveal

    RowLayout{
        spacing: 20
        anchors.centerIn:  parent
        Rectangle {
                width: 300
                height: 300
                anchors.centerIn: parent
                radius: 20
                border.width: 2
                color: "white"

                FastBlur {
                    anchors.fill: parent
                    radius: 20
                    source: reveal
                }
                Column {
                    anchors.centerIn: parent
                    spacing: 10

                    Text {
                        text: "Glass Effect"
                        font.pixelSize: 24
                        color: "black"
                    }

                    Rectangle{
                        radius: 8
                        height: 50
                        width:  200
                        border.color: "magenta"
                        border.width: 3
                        clip: true

                        TextInput{
                            anchors {
                                left: parent.left
                                right: parent.right
                            }
                            color: "black"
                            maximumLength: 120
                            padding: 8
                            font.pixelSize: 16
                            width: parent.width - 20
                        }
                    }


                    Button {
                        text: "Button"
                    }
                }
            }
    }
}
