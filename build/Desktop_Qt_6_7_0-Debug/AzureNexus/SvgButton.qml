import QtQuick
import QtQuick.Controls
import QtQuick.Shapes
import QtMultimedia
import Qt5Compat.GraphicalEffects

// file:///home/azure/AzureNexus/icon2.svg
// file:///home/azure/Downloads/ShinkaY.gif
// file:///home/azure/Downloads/file:///home/azure/Downloads/sunaookami-shiroko.mp4
Item {
    id: root
    width: 100
    height: 100

    property bool clicked: false

    // Rectangle {
    //     id: rectX
    //     width: parent.width
    //     height: 100
    //     radius: 20
    //     clip: true
    //     color: "transparent"

    //     MediaPlayer {
    //         id: mediaPlayer
    //         videoOutput: videoOutput
    //         source: "file:///home/azure/Downloads/sunaookami-shiroko.mp4"
    //         autoPlay: true
    //     }

    //     VideoOutput {
    //         id: videoOutput
    //         anchors.fill: parent
    //         visible: true
    //         fillMode: VideoOutput.PreserveAspectFit
    //         TapHandler {
    //             onDoubleTapped: {
    //                 root.fullScreen ? root.showNormal() : root.showFullScreen()
    //                 root.fullScreen = !root.fullScreen
    //             }
    //         }
    //     }
    // }

    // AnimatedImage {
    //     id: svgImage
    //     width: parent.width
    //     height: parent.height
    //     source: "file:///home/azure/Downloads/ShinkaY.gif"
    // }
    Image {
        id: svgImageStatic
        width: parent.width
        height: parent.height
        source: "file:///home/azure/AzureNexus/icon2.svg"
    }
    Wayland {}
}
