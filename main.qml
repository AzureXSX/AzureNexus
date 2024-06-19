import QtQuick
import QtQuick.Controls
import QtWayland.Compositor
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import QtQuick.Dialogs

ApplicationWindow {
    width: 640
    height: 480
    minimumWidth: 640
    minimumHeight: 480
    visible: true
    title: qsTr("Hello World")
    color:  "#80111111"//ARGB
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
                color: "transparent"


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
                            id: button
                            anchors {
                                left: parent.left
                                right: parent.right
                            }
                            text: "Button"

                            background: Rectangle {
                                id: buttonBackground
                                implicitWidth: 100
                                implicitHeight: 40
                                color: "#f6f6f6"
                                border.color: "#26282a"
                                border.width: 1
                                radius: 4

                                Behavior on color {
                                    ColorAnimation {
                                        duration: 200
                                    }
                                }
                            }

                            MouseArea {
                                id: mouseArea
                                anchors.fill: parent
                                hoverEnabled: true

                                onEntered: {
                                    buttonBackground.color = "lime"  // Hover color
                                }
                                onExited: {
                                    buttonBackground.color = "#f6f6f6"  // Normal color
                                }
                                onPressed: {
                                    buttonBackground.color = "#d6d6d6"  // Pressed color
                                }
                                onReleased: {
                                    if (containsMouse) {
                                        buttonBackground.color = "#e6e6e6"  // Hover color
                                    } else {
                                        buttonBackground.color = "#f6f6f6"  // Normal color
                                    }
                                }
                            }

                            onClicked: {
                                notificationPopup.open()
                            }
                    }


                }
            }
    }
}
