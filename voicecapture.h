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
#include <QAudioSource>
class VoiceCapture : public QObject
{
    Q_OBJECT
public:
    explicit VoiceCapture(QObject* parent = nullptr);
    Q_INVOKABLE void start();
    Q_INVOKABLE void stop();
    static void handleStateChanged(QAudio::State newState);
    VoiceCapture();
    ~VoiceCapture();
private:
    QMediaCaptureSession* session;
    QMediaRecorder* recorder;
    QAudioInput* audioInput;
    QByteArray audioData;
    QBuffer* buffer;
    QAudioSource* audioSource;
};

#endif // VOICECAPTURE_H
