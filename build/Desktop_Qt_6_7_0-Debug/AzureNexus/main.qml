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
    color: "#2e3440" //ARGB |11456299
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
            highlight: Rectangle {
                color: "#464EB8"
                radius: 5
            }
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
                border.color: "#464EB8"
                radius: 10
                clip: true

                // AnimatedImage {
                //     id: svgImage
                //     width: parent.width
                //     height: parent.height
                //     source: "file:///home/azure/Downloads/ShinkaY.gif"
                // }
                Image {
                    width: 50
                    height: 50
                    source: "file:///home/azure/AzureNexus/icon1.svg"
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
}
