#include "screencapture.h"

ScreenCapture::ScreenCapture() {}

ScreenCapture::ScreenCapture(int, int) {

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
    QScreen *screen = QGuiApplication::primaryScreen();
    if (!screen) {
        qWarning() << "No primary screen found.";
        return;
    }

    qDebug() << "Screen name: " << screen->name() << "\n";
    qDebug() << "Resolution: " << screen->geometry().width() << "x" << screen->geometry().height() << "\n";

    // Grab the window under the cursor
    QPixmap screenshot = screen->grabWindow(0);

    if (!screenshot.isNull()) {
        QString filename = QString("screenshot_%1.png").arg(QDateTime::currentDateTime().toString("yyyyMMdd_HHmmss"));
        if (saveScreenshot(screenshot, filename)) {
            qDebug() << "Screenshot saved to" << filename;
        } else {
            qWarning() << "Failed to save screenshot.";
        }
    } else {
        qWarning() << "Failed to capture screenshot.";
    }
}
