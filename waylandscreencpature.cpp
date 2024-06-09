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

    QString compositor;

    QStringList knownCompositors = {"weston", "kwin_wayland", "sway", "gnome-shell", "compton", "mutter", "hyprland"};

    QProcess process;
    process.start("ps", QStringList() << "-e" << "-o" << "comm=");
    process.waitForFinished();
    QString output = process.readAllStandardOutput();

    for (const QString &comp : knownCompositors) {
        if (output.contains(comp, Qt::CaseInsensitive)) {
            compositor = comp;
            break;
        }
    }

    if (!compositor.isEmpty()) {
        qDebug() << "Detected Wayland compositor:" << compositor;
    } else {
        qDebug() << "No known Wayland compositor detected. Running custom or unknown compositor.";
    }

    setSocketName(waylandDisplay);
    create();

    qDebug() << "Socekt ? " << socketName() << "\n";

    qDebug() << "Initialization complete";
}

void WaylandScreenCapture::create(){
    qDebug() << "Creating...\n";
}

Q_INVOKABLE void WaylandScreenCapture::takeScreenShot(){

}
