#include "waylandscreencpature.h"

WaylandScreenCapture::WaylandScreenCapture(QObject* parent)
    : QWaylandCompositor(parent)
{
    // Constructor implementation
}
WaylandScreenCapture::WaylandScreenCapture() {}

Q_INVOKABLE void WaylandScreenCapture::init() {
    qDebug() << "Initializing Wayland Screen Capture";
    QByteArray waylandDisplay = qgetenv("WAYLAND_DISPLAY");
    if (waylandDisplay.isEmpty()) {
        qWarning() << "WAYLAND_DISPLAY is not set. Unable to connect to Wayland display.";
        return;
    }

    qDebug() << "Connecting to Wayland display:" << waylandDisplay;

    QByteArray desktopSession = qgetenv("DESKTOP_SESSION");
    QByteArray xdgSessionDesktop = qgetenv("XDG_SESSION_DESKTOP");

    if (!desktopSession.isEmpty()) {
        qDebug() << "Desktop session:" << desktopSession;
    }

    if (!xdgSessionDesktop.isEmpty()) {
        qDebug() << "XDG session desktop:" << xdgSessionDesktop;
    }

    QStringList knownCompositors = {"weston", "kwin_wayland", "sway", "gnome-shell", "compton", "mutter", "hyprland"};

    QProcess process;
    process.start("ps", QStringList() << "-e" << "-o" << "comm=");
    process.waitForFinished();
    QString output = process.readAllStandardOutput();

    for (const QString &comp : knownCompositors) {
        if (output.contains(comp, Qt::CaseInsensitive)) {
            detectedCompositor = comp;
            break;
        }
    }

    if (!detectedCompositor.isEmpty()) {
        qDebug() << "Detected Wayland compositor:" << detectedCompositor;
    } else {
        qDebug() << "No known Wayland compositor detected. Running custom or unknown compositor.";
    }

    connectToCompositor();
    qDebug() << "Initialization complete";
}

void WaylandScreenCapture::connectToCompositor() {
    display = wl_display_connect(nullptr);
    if (!display) {
        qWarning() << "Failed to connect to Wayland display.";
        return;
    }

    registry = wl_display_get_registry(display);
    if (!registry) {
        qWarning() << "Failed to get Wayland registry.";
        wl_display_disconnect(display);
        return;
    }

    static const struct wl_registry_listener registryListener = {
        registryHandler,
        registryRemover
    };

    wl_registry_add_listener(registry, &registryListener, this);
    wl_display_roundtrip(display);
    qDebug() << "Connected to Wayland compositor.";
}

void WaylandScreenCapture::registryHandler(void* data, struct wl_registry* registry, uint32_t id, const char* interface, uint32_t version) {
    WaylandScreenCapture* self = static_cast<WaylandScreenCapture*>(data);
    qDebug() << "Interface added:" << interface << "ID:" << id << "Version:" << version;

    // Here you can bind to interfaces you are interested in, e.g. wl_compositor, wl_shell, etc.
}

void WaylandScreenCapture::registryRemover(void* data, struct wl_registry* registry, uint32_t id) {
    qDebug() << "Interface removed ID:" << id;
}

Q_INVOKABLE void WaylandScreenCapture::takeScreenShot(){

}
