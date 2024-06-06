#ifndef VOICECAPTURE_H
#define VOICECAPTURE_H

#include <QObject>
class VoiceCapture : public QObject
{
    Q_OBJECT
public:
    explicit VoiceCapture(QObject* parent);
    VoiceCapture();
};

#endif // VOICECAPTURE_H
