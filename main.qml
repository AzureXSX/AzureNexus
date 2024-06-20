import QtQuick
import QtQuick.Controls
import QtWayland.Compositor
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import QtQuick.Dialogs

ApplicationWindow {
    width: screenWidth
    height: screenHeight
    minimumWidth: 640
    minimumHeight: 480
    visible: true
    title: qsTr("Hello World")
    color: "#373f51" //ARGB |11456299
    //visibility: "FullScreen"
    id: mainWindow

    onWidthChanged: {
        console.log(width)
    }

    Rectangle {
        width: 65
        height: parent.height
        color: "black"

        ListView {
            width: 65
            spacing: 20
            anchors.fill: parent
            id: contacts

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
            }

            delegate: Rectangle {
                width: 50
                height: 50
                color: model.color
                border.width: 1
                border.color: "black"
                radius: 10
                anchors.topMargin: 20
            }
        }
    }
}
