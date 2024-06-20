import QtQuick
import QtQuick.Controls
import QtWayland.Compositor
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import QtQuick.Dialogs

ApplicationWindow {
    height: 270
    width: 215
    minimumWidth: 215
    minimumHeight: 270
    maximumHeight: 270
    maximumWidth: 215
    visible: true
    color: "#36393e"

    ColumnLayout {
        anchors.centerIn: parent
        height: parent.height

        ProgressBar {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            id: progressBar
            from: 0
            to: 100
            value: 0
            Layout.preferredWidth: 170
            height: 5

            background: Rectangle {
                color: "#2f3136"
                radius: 10
            }

            contentItem: Rectangle {
                width: parent.width * (progressBar.value / progressBar.to)
                height: parent.height
                color: "#8e9297" // | 5865F2
                radius: 10
            }
            Timer {
                id: timer
                interval: 30
                running: true
                repeat: true
                onTriggered: {
                    progressBar.value = (progressBar.value + 1) % 101
                    if (progressBar.value >= 100) {
                        timer.stop()
                        sp.startLoginProcess()
                    }
                }
            }
        }
    }
}
