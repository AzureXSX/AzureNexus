#include "voicecapture.h"

VoiceCapture::VoiceCapture(QObject* parent) : QObject(parent){

};

VoiceCapture::VoiceCapture() {
    session = new QMediaCaptureSession();
    session->setAudioInput(new QAudioInput(QMediaDevices::defaultAudioInput()));
    recorder = new QMediaRecorder();
    session->setRecorder(recorder);

    qDebug() << session->audioInput()->device().description() << "\n";

    QMediaFormat *format = new QMediaFormat();
    format->setFileFormat(QMediaFormat::Mpeg4Audio);
    session->recorder()->setMediaFormat(*format);
    session->recorder()->setAudioSampleRate(44100);
    session->recorder()->setAudioChannelCount(1);
    session->recorder()->setQuality(QMediaRecorder::HighQuality);
    session->recorder()->setEncodingMode(QMediaRecorder::ConstantQualityEncoding);
    //session->recorder()->setOutputLocation(QUrl::fromLocalFile("/home/azure/AzureNexus/build/Desktop_Qt_6_7_0-Debug/test"));
    buffer = new QBuffer(&audioData);
    buffer->open(QIODevice::ReadWrite);
}

Q_INVOKABLE void VoiceCapture::start() {
    if (session->recorder()) {
        session->recorder()->record();
        qDebug() << "Started " << "\n";
        qDebug() << session->recorder()->recorderState() << "\n";
    } else {
        qDebug() << (session->recorder() == NULL) << "\n";
        qDebug() << (session == NULL) << "\n";
    }
}

Q_INVOKABLE void VoiceCapture::stop() {
    if (session->recorder()) {
        session->recorder()->stop();
        qDebug() << "Stopped " << "\n";
        qDebug() << session->recorder()->recorderState() << "\n";
    } else {
        qDebug() << (session->recorder() == NULL) << "\n";
    }
}
