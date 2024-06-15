#ifndef WAYLANDSCREENCPATURE_H
#define WAYLANDSCREENCPATURE_H

#include <QObject>
#include <QWaylandCompositor>
#include <QWaylandQuickCompositor>
#include <QDebug>
#include <QWaylandClient>
#include <QFile>
#include <QImageWriter>
#include <QProcess>
#include <wayland-client.h>

class WaylandScreenCapture : public QWaylandCompositor
{
    Q_OBJECT
public:

    QString detectedCompositor;

    struct wl_display* display = nullptr;
    struct wl_registry* registry = nullptr;

    static void registryHandler(void* data, struct wl_registry* registry, uint32_t id, const char* interface, uint32_t version);
    static void registryRemover(void* data, struct wl_registry* registry, uint32_t id);

    void connectToCompositor();

    Q_INVOKABLE void init();
    Q_INVOKABLE void takeScreenShot();
    void create() override;
    explicit WaylandScreenCapture(QObject* parent = nullptr);
    WaylandScreenCapture();
};

#endif // WAYLANDSCREENCPATURE_H
