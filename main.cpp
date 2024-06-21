#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QScreen>
#include <QWindow>
#include "../Documents/GitHub/Linux-x64-HTTP3/client/QuicClient.h"
#include "ColorsConfig.h"
#include "splashscreen.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    const char *host = "10.10.3.201";
    uint16_t udpPort = 6121;
    const char *cert = "/home/azure/Documents/GitHub/Linux-x64-HTTP3/certs/server.cert";
    const char *key = "/home/azure/Documents/GitHub/Linux-x64-HTTP3/certs/server.key";

    QuicClient *client = new QuicClient("10.10.3.201", 6121, "nexus", cert, key);
    client->Connect();
    QQmlApplicationEngine engine;

    QScreen *screen = QGuiApplication::primaryScreen();
    QRect screenGeometry = screen->geometry();

    SplashScreen sp(&engine);
    ColorsConfig colorsConfig;

    engine.rootContext()->setContextProperty("ColorsConfig", &colorsConfig);
    engine.rootContext()->setContextProperty("sp", &sp);
    engine.rootContext()->setContextProperty("screenWidth", screenGeometry.width());
    engine.rootContext()->setContextProperty("screenHeight", screenGeometry.height());

    const QString svgImagePath = "qrc:/svg/icon1.svg";

    engine.rootContext()->setContextProperty("svgImagePath", svgImagePath);

    const QUrl url(QStringLiteral("qrc:/AzureNexus/login.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
