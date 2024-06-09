#ifndef SCREENCAPTURE_H
#define SCREENCAPTURE_H

#include <QObject>
#include <QScreen>
#include <QPixmap>
#include <QDateTime>
#include <QBuffer>
#include <QFile>
#include <QScreenCapture>
#include <QMediaCaptureSession>
#include <QDebug>
#include <QWaylandSurfaceGrabber>
#include <QWaylandSurface>
#include <QWaylandClient>

class ScreenCapture : public QObject
{
    Q_OBJECT;
public:
    explicit ScreenCapture(QObject *parent = nullptr);
    Q_INVOKABLE void takeScreenShot();
    ScreenCapture();
    ~ScreenCapture();
private:
    QWaylandCompositor* compositor;
};

#endif // SCREENCAPTURE_H
