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

class ScreenCapture : public QObject
{
    Q_OBJECT;
public:
    explicit ScreenCapture(QObject *parent = nullptr);
    Q_INVOKABLE void takeScreenShot();
    ScreenCapture(int width = 0, int height = 0);
    ScreenCapture();
private:
    QScreenCapture screenCapture;
    QMediaCaptureSession captureSession;
};

#endif // SCREENCAPTURE_H
