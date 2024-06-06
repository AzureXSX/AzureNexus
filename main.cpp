#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QWindow>

#include "quicclient.h"
#include "screencapture.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    const char *host = "10.10.3.201";
    uint16_t udpPort = 6121;
    const char *cert = "/home/azure/Documents/GitHub/Linux-x64-HTTP3/certs/server.cert";
    const char *key = "/home/azure/Documents/GitHub/Linux-x64-HTTP3/certs/server.key";

    QuicClient quicClient(host, udpPort, cert, key);
    ScreenCapture screenCapture(0,0);

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("quicClient", &quicClient);
    engine.rootContext()->setContextProperty("screenCapture", &screenCapture);

    const QUrl url(QStringLiteral("qrc:/AzureNexus/main.qml"));
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
