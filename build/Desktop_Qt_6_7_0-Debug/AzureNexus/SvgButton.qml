import QtQuick
import QtQuick.Controls
import QtQuick.Shapes

import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: 100
    height: 100

    property bool clicked: false

    AnimatedImage {
        id: svgImage
        width: 100
        height: 100
        // file:///home/azure/AzureNexus/icon2.svg
        source: "file:///home/azure/Downloads/ShinkaY.gif"
    }
}
