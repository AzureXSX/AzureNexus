import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


/*
    W 83.33% {
        Top 90.63% | H 8.33%
        Left 18.75%
        Middle 48.44% | 46.88% H
        Right 20.31%
    }
    TextAreaH 5.56%
*/
ApplicationWindow {
    width: setWidth
    height: screenHeight
    minimumWidth: 840
    minimumHeight: 420
    visible: true
    title: qsTr("Hello World")
    color: ColorsConfig.backgroundDarkest
    visibility: "FullScreen"
    id: mainWindow

    onWidthChanged: {
        console.log(width)
    }

    Rectangle {
        id: contentItem
        Layout.fillWidth: true
        implicitHeight: grid.implicitHeight
        implicitWidth: grid.implicitWidth
        color: "transparent"

        GridLayout {
            anchors.fill: parent
            id: grid
            columns: 2
            anchors.margins: 8

            Rectangle {
                implicitWidth: parent.width * .97
                implicitHeight: 60
                Layout.alignment: Qt.AlignTop | Qt.AlignCenter
            }
        }
    }

    RowLayout {
        id: smallLayout
        anchors.fill: parent
        Rectangle {
            id: contacts_wrapper
            implicitWidth: 65
            implicitHeight: parent.height
            color: ColorsConfig.backgroundDarker

            Rectangle {
                height: 7
                width: 7
                radius: 50
                anchors {
                    left: parent.left
                }
                color: "white"
                x: 3 // Adjust this value to place the dot on the left of the item
                y: contacts.currentItem ? contacts.currentItem.y + 27 : 27
                Behavior on y {
                    SpringAnimation {
                        spring: 2
                        damping: 0.1
                    }
                }
            }
            ListView {
                width: 65
                spacing: 20
                anchors.fill: parent
                anchors.leftMargin: 12.5
                anchors.topMargin: 10
                anchors.horizontalCenter: contacts_wrapper.horizontalCenter
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
                        color: "lightgreen"
                    }
                    ListElement {
                        color: "lightcoral"
                    }
                }

                delegate: Loader {
                    width: 40
                    height: 40

                    sourceComponent: {

                        switch (index) {
                        case 0:
                            return firstDelegateComponent
                        case contacts.model.count - 1:
                            return lastDelegateComponent
                        default:
                            return defaultDelegateComponent
                        }
                    }

                    Component {
                        id: firstDelegateComponent

                        Rectangle {
                            width: 40
                            height: 40
                            color: "transparent"
                            border.width: 1
                            border.color: "transparent"
                            radius: 10
                            clip: false

                            Rectangle {
                                width: 40
                                height: 1
                                color: "white"
                                clip: false // Do not clip this rectangle
                                anchors {
                                    horizontalCenter: parent.horizontalCenter
                                    bottom: parent.bottom
                                    bottomMargin: -10
                                }
                            }

                            Component.onCompleted: {
                                console.log("Delegate created for index: " + index)
                            }

                            Rectangle {
                                id: container
                                color: contacts.currentIndex == index ? ColorsConfig.mainBlueDark : ColorsConfig.backgroundDarkGray
                                width: parent.width
                                height: parent.height
                                radius: parent.radius
                                clip: true

                                Connections {
                                    target: contacts
                                    onCurrentIndexChanged: {
                                        console.log("Current index changed to: "
                                                    + contacts.currentIndex)
                                    }
                                }

                                Image {
                                    width: parent.width * .5
                                    height: parent.width * .5
                                    z: 1
                                    anchors.centerIn: parent
                                    source: "file:///home/azure/Downloads/Vector.svg"
                                }
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    contacts.currentIndex = index
                                }
                            }
                        }
                    }

                    Component {
                        id: lastDelegateComponent
                        Rectangle {
                            width: 40
                            height: 40
                            color: "transparent"
                            border.width: 1
                            border.color: "transparent"
                            radius: 50
                            clip: false

                            Component.onCompleted: {
                                console.log("Delegate created for index: " + index)
                            }

                            Rectangle {
                                width: 40
                                height: 1
                                color: "white"
                                clip: false // Do not clip this rectangle
                                anchors {
                                    horizontalCenter: parent.horizontalCenter
                                    top: parent.top
                                    topMargin: -10
                                }
                            }

                            Rectangle {
                                id: container
                                color: contacts.currentIndex == index ? ColorsConfig.mainBlueDark : ColorsConfig.backgroundDarkGray
                                width: parent.width
                                height: parent.height
                                radius: parent.radius
                                clip: true

                                Connections {
                                    target: contacts
                                    onCurrentIndexChanged: {
                                        console.log("Current index changed to: "
                                                    + contacts.currentIndex)
                                    }
                                }

                                Image {
                                    z: 1
                                    width: parent.width * .5
                                    height: parent.width * .5
                                    anchors.centerIn: parent
                                    source: "file:///home/azure/Downloads/Vector(1).svg"
                                }
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    contacts.currentIndex = index
                                }
                            }
                        }
                    }

                    Component {
                        id: defaultDelegateComponent
                        Rectangle {
                            width: 40
                            height: 40
                            color: "transparent"
                            border.width: 1
                            border.color: "transparent"
                            radius: 10
                            clip: true

                            Component.onCompleted: {
                                console.log("Delegate created for index: " + index)
                            }

                            Rectangle {
                                id: container
                                color: contacts.currentIndex == index ? ColorsConfig.mainBlueDark : ColorsConfig.backgroundDarkGray
                                width: parent.width
                                height: parent.height
                                radius: parent.radius
                                clip: true

                                Connections {
                                    target: contacts
                                    onCurrentIndexChanged: {
                                        console.log("Current index changed to: "
                                                    + contacts.currentIndex)
                                    }
                                }

                                // AnimatedImage {
                                //     id: svgImage
                                //     width: parent.width - 5
                                //     height: parent.height - 5
                                //     z: 1
                                //     anchors.centerIn: parent
                                //     source: "file:///home/azure/Downloads/ShinkaY.gif"
                                // }

                                // PaddedRectangle {
                                //     id: wrapperx
                                //     anchors.fill: parent
                                //     z: 2
                                //     color: "transparent"
                                //     radius: 75
                                //     border.width: 5
                                //     border.color: contacts.currentIndex == index ? ColorsConfig.mainBlueDark : ColorsConfig.backgroundDarkGray
                                //     padding: 0
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
            }
        }

        Flickable {
            Layout.fillHeight: true
            Layout.fillWidth: true
            contentWidth: width
            contentHeight: gl.implicitHeight
            clip: true
            ScrollIndicator.vertical: ScrollIndicator {}
            LayoutItemProxy {
                id: gl
                width: parent.width
                height: implicitHeight
                target: contentItem
            }
        }
    }
}
