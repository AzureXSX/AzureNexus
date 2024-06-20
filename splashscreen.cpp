#include "splashscreen.h"

SplashScreen::SplashScreen(QQmlApplicationEngine *engine, QObject *parent)
    : QObject(parent)
    , m_engine(engine)
{}

void SplashScreen::startLoginProcess()
{
    QTimer::singleShot(3000, [this]() {
        QObject *loginWindow = m_engine->rootObjects().first();
        loginWindow->setProperty("visible", false);

        m_engine->load(QUrl(QStringLiteral("qrc:/AzureNexus/main.qml")));
        if (m_engine->rootObjects().isEmpty()) {
            qWarning() << "Failed to load main.qml";
            return;
        }
    });
}
