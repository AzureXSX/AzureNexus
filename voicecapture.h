#ifndef VOICECAPTURE_H
#define VOICECAPTURE_H

#include <QObject>
#include <QAudioInput>
#include <QAudioDevice>
#include <QMediaDevices>
#include <QDebug>
#include <QMediaCaptureSession>
#include <QMediaRecorder>
#include <QUrl>
#include <QMediaFormat>
#include <QFileDialog>
#include <QBuffer>
class VoiceCapture : public QObject
{
    Q_OBJECT

    QMediaCaptureSession* session;
    QMediaRecorder* recorder;
    QAudioInput* audioInput;
    QByteArray audioData;
    QBuffer* buffer;
public:
    explicit VoiceCapture(QObject* parent);
    Q_INVOKABLE void start();
    Q_INVOKABLE void stop();
    VoiceCapture();
};

#endif // VOICECAPTURE_H
