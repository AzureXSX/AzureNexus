import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    width: screenWidth
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

    GridLayout {
        id: x_window_wrapper
        Rectangle {
            id: contacts_wrapper
            Layout.column: 0
            Layout.preferredWidth: 65
            Layout.preferredHeight: parent.height
            color: ColorsConfig.backgroundDarker

            Layout.alignment: Qt.AlignLeft

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

        GridLayout {
            Layout.column: 1
            id: x_window_grid
            Layout.preferredWidth: screenWidth - contacts_wrapper.width
            Layout.preferredHeight: screenHeight
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            rows: 2
            columnSpacing: 0
            rowSpacing: 0

            Rectangle {
                id: headerx
                Layout.topMargin: 30
                Layout.row: 0
                Layout.columnSpan: 3
                Layout.preferredWidth: x_window_grid.width * 0.96
                Layout.preferredHeight: x_window_grid.height * 0.08
                color: ColorsConfig.backgroundDarker
                radius: 8
                Layout.alignment: Qt.AlignTop | Qt.AlignHCenter

                ColumnLayout {
                    width: parent.width
                    height: parent.height
                }
            }

            // First column in the second row, occupying 80% of the GridLayout height
            Rectangle {
                Layout.topMargin: 24.3
                Layout.row: 1
                Layout.column: 0
                Layout.leftMargin: Math.abs(
                                       (headerx.width - x_window_grid.width) / 2)
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: x_window_grid.width * 0.25
                Layout.preferredHeight: x_window_grid.height * 0.88 - 24.3
                color: ColorsConfig.backgroundDarker
                topRightRadius: 8 // No radius for top right corner
                bottomLeftRadius: 0 // No radius for bottom left corner
                bottomRightRadius: 0 // Radius for bottom right corner
                topLeftRadius: 8 // Radius for top left corner

                ColumnLayout {
                    width: parent.width
                    height: parent.height
                }
            }

            // Second column in the second row, occupying 80% of the GridLayout height
            Rectangle {
                Layout.topMargin: 24.3
                Layout.row: 1
                Layout.column: 1
                Layout.preferredWidth: x_window_grid.width * 0.4
                Layout.preferredHeight: x_window_grid.height * 0.88 - 24.3
                color: ColorsConfig.backgroundDarker
                topRightRadius: 8 // No radius for top right corner
                bottomLeftRadius: 0 // No radius for bottom left corner
                bottomRightRadius: 0 // Radius for bottom right corner
                topLeftRadius: 8 // Radius for top left corner

                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

                ColumnLayout {
                    width: parent.width
                    height: parent.height

                    ScrollView {
                        id: view
                        width: 350
                        height: 30
                        clip: true

                        background: Rectangle {
                            anchors.fill: parent
                            color: ColorsConfig.backgroundDarkGray
                            radius: 10
                        }

                        Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter

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
                            placeholderTextColor: "white"
                            onContentHeightChanged: {
                                if (contentHeight > 30
                                        && contentHeight <= 200) {
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
            }

            // Third column in the second row, occupying 80% of the GridLayout height
            Rectangle {
                Layout.topMargin: 24.3
                Layout.alignment: Qt.AlignRight | Qt.AlignTop
                Layout.rightMargin: Math.abs(
                                        (headerx.width - x_window_grid.width) / 2)
                Layout.row: 1
                Layout.column: 2
                Layout.preferredWidth: x_window_grid.width * 0.28
                Layout.preferredHeight: 160
                color: ColorsConfig.mainBlueDark
                //radius: 8
                topRightRadius: 8 // No radius for top right corner
                bottomLeftRadius: 0 // No radius for bottom left corner
                bottomRightRadius: 0 // Radius for bottom right corner
                topLeftRadius: 8 // Radius for top left corner

                ColumnLayout {
                    width: parent.width
                    height: x_window_grid.height
                }
            }
        }
    }
}
