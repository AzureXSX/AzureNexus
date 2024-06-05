#include "screencapture.h"

ScreenCapture::ScreenCapture() {}

ScreenCapture::ScreenCapture(int, int) {

}

ScreenCapture::ScreenCapture(QObject *parent) : QObject(parent) {
}

Q_INVOKABLE void ScreenCapture::takeScreenShot(){
    QImage screenshot = QGuiApplication::primaryScreen()->grabWindow(0).toImage();

    // Create a byte array to hold the image data
    QByteArray imageData;

    // Create a buffer and open it for writing
    QBuffer buffer(&imageData);
    buffer.open(QIODevice::WriteOnly);

    // Save the screenshot to the buffer in JPEG format
    screenshot.save(&buffer, "JPEG");

    // Close the buffer after writing
    buffer.close();

    // Save the buffer contents to a file
    QFile file("screenshot.jpg");
    if (file.open(QIODevice::WriteOnly)) {
        file.write(imageData);
        file.close();
        qDebug() << "Screenshot saved as screenshot.jpg";
    } else {
        qDebug() << "Failed to save screenshot";
    }
}
