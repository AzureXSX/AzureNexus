import QtQuick
import QtQuick.Controls
import QtWayland.Compositor
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import QtQuick.Dialogs

ApplicationWindow {
    width: screenWidth
    height: screenHeight
    minimumWidth: 840
    minimumHeight: 420
    visible: true
    title: qsTr("Hello World")
    //373f51
    color: ColorsConfig.backgroundDarker
    //ARGB |11456299
    //visibility: "FullScreen"
    id: mainWindow

    onWidthChanged: {
        console.log(width)
    }

    Rectangle {
        width: 65
        height: parent.height
        color: "black"
        anchors {
            left: parent.left
            right: undefined
            rightMargin: undefined
        }

        ListView {
            width: 65
            spacing: 20
            anchors.fill: parent
            anchors.leftMargin: 7
            anchors.topMargin: 10
            id: contacts
            focus: true

            model: ListModel {
                ListElement {
                    color: "lightblue"
                }
                ListElement {
                    color: "lightgreen"
                }
                ListElement {
                    color: "lightcoral"
                }
                ListElement {
                    color: "lightblue"
                }
                ListElement {
                    color: "lightgreen"
                }
                ListElement {
                    color: "lightcoral"
                }
                ListElement {
                    color: "lightblue"
                }
                ListElement {
                    color: "lightgreen"
                }
                ListElement {
                    color: "lightcoral"
                }
                ListElement {
                    color: "lightblue"
                }
                ListElement {
                    color: "lightgreen"
                }
                ListElement {
                    color: "lightcoral"
                }
                ListElement {
                    color: "lightblue"
                }
                ListElement {
                    color: "lightgreen"
                }
                ListElement {
                    color: "lightcoral"
                }
                ListElement {
                    color: "lightblue"
                }
                ListElement {
                    color: "lightgreen"
                }
                ListElement {
                    color: "lightcoral"
                }
                ListElement {
                    color: "lightblue"
                }
                ListElement {
                    color: "lightgreen"
                }
                ListElement {
                    color: "lightcoral"
                }
            }

            delegate: Rectangle {
                width: 50
                height: 50
                color: "transparent"
                border.width: 1
                border.color: "transparent"
                radius: 10
                clip: true

                Rectangle {
                    id: container
                    color: "transparent"
                    width: 50
                    height: 50
                    radius: 50 // Adjust the radius value for your desired rounded corners
                    clip: true // Enable clipping

                    AnimatedImage {
                        id: svgImage
                        width: 40
                        height: 40
                        anchors.centerIn: parent
                        source: "file:///home/azure/Downloads/ShinkaY.gif"
                    }

                    PaddedRectangle {
                        id: wrapperx
                        anchors.fill: parent
                        color: "transparent"
                        radius: 50
                        border.width: 15
                        border.color: "black"
                        padding: -8
                    }

                    // Image {
                    //     width: 50
                    //     height: 50
                    //     source: "file:///home/azure/AzureNexus/icon1.svg"
                    // }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        contacts.currentIndex = index
                    }
                }
            }
        }
    }
    SvgButton {
        anchors.centerIn: parent
    }
    PaddedRectangle {
        color: "transparent"
        border.color: "black"
        border.width: 0
        leftPadding: 8
        bottomPadding: 0

        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: 35
        }

        Rectangle {
            width: parent.width
            height: 1
            color: "transparent"
            border.width: 1
            border.color: "white"
            radius: 20
            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
            }
        }

        width: 300
        radius: 8
        height: 25
        clip: true
    }
    ScrollView {
        id: view
        width: 300
        height: 500

        TextArea {
            id: message_input
            width: parent.width
            height: contentHeight
            color: "white"
            font.pixelSize: 11 // Font size in pixels
            leftPadding: 8
            rightPadding: 8
            anchors {
                bottom: parent.bottom
                bottomMargin: 1.5
            }
            placeholderText: "Enter your message here..."
            placeholderTextColor: "#464EB8"
        }
    }
}
