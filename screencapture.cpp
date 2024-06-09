#include "screencapture.h"

ScreenCapture::ScreenCapture() {}

ScreenCapture::~ScreenCapture(){

}

ScreenCapture::ScreenCapture(QObject *parent) : QObject(parent) {
}

bool saveScreenshot(const QPixmap &pixmap, const QString &filename) {
    QFile file(filename);
    if (!file.open(QIODevice::WriteOnly)) {
        qWarning() << "Failed to open file for writing:" << filename;
        return false;
    }
    QDataStream out(&file);
    out << pixmap;
    file.close();
    return true;
}

Q_INVOKABLE void ScreenCapture::takeScreenShot(){
    compositor = new QWaylandCompositor();

    compositor->create();
}
