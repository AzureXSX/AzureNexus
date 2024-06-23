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

        Rectangle {
            anchors.centerIn: parent
            width: 100
            height: 100
            radius: 10
            color: "#88456299"
            opacity: .8
        }
    }
    ScrollView {
        id: view
        width: 350
        height: 30
        clip: true

        background: Rectangle {
            anchors.fill: parent
            color: "black"
            radius: 10
        }

        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: 15.5
        }

        leftPadding: 10
        rightPadding: 10
        bottomPadding: 2.5
        topPadding: 2.5

        TextArea {
            id: message_input
            width: parent.width
            height: contentHeight
            color: "white"
            font.pixelSize: 11 // Font size in pixels
            leftPadding: 8
            rightPadding: 8
            wrapMode: TextEdit.Wrap // Enable text wrapping

            placeholderText: "Enter your message here..."
            placeholderTextColor: "#464EB8"
            onContentHeightChanged: {
                if (contentHeight > 30 && contentHeight <= 200) {
                    view.height = contentHeight
                } else if (contentHeight <= 30) {
                    view.height = 30
                } else if (contentHeight > 200) {
                    view.height = 200 // Set a maximum height if needed
                }
            }
        }
    }
}
