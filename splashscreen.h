#ifndef SPLASHSCREEN_H
#define SPLASHSCREEN_H

#include <QDebug>
#include <QObject>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTimer>

class SplashScreen : public QObject
{
    Q_OBJECT
public:
    explicit SplashScreen(QQmlApplicationEngine *engine, QObject *parent = nullptr);

    Q_INVOKABLE void startLoginProcess();

private:
    QQmlApplicationEngine *m_engine;
};

#endif // SPLASHSCREEN_H
