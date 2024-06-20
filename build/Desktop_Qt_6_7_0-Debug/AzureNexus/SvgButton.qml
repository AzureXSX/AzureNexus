import QtQuick
import QtQuick.Controls
import QtQuick.Shapes
import QtMultimedia

import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: 150
    height: 150

    property bool clicked: false

    MediaPlayer {
        id: mediaPlayer
        videoOutput: videoOutput
        source: "file:///home/azure/Downloads/sunaookami-shiroko.mp4"
        autoPlay: true
    }

    VideoOutput {
        id: videoOutput
        anchors.fill: parent
        visible: true

        TapHandler {
            onDoubleTapped: {
                root.fullScreen ? root.showNormal() : root.showFullScreen()
                root.fullScreen = !root.fullScreen
            }
        }
    }

    // AnimatedImage {
    //     id: svgImage
    //     width: 100
    //     height: 100
    //     // file:///home/azure/AzureNexus/icon2.svg
    //     // file:///home/azure/Downloads/ShinkaY.gif
    //     // file:///home/azure/Downloads/file:///home/azure/Downloads/sunaookami-shiroko.mp4
    //     source: "file:///home/azure/Downloads/file:///home/azure/Downloads/sunaookami-shiroko.mp4"
    // }
}
