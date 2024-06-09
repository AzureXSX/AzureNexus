#include "waylandscreencpature.h"

WaylandScreenCapture::WaylandScreenCapture(QObject* parent)
    : QWaylandCompositor(parent)
{
    // Constructor implementation
}
WaylandScreenCapture::WaylandScreenCapture() {}

Q_INVOKABLE void WaylandScreenCapture::init() {
    qDebug() << "Initializing Wayland Screen Capture";

    // Check the WAYLAND_DISPLAY environment variable
    QByteArray waylandDisplay = qgetenv("WAYLAND_DISPLAY");
    if (waylandDisplay.isEmpty()) {
        qWarning() << "WAYLAND_DISPLAY is not set. Unable to connect to Wayland display.";
        return;
    }

    qDebug() << "Connecting to Wayland display:" << waylandDisplay;

    // Check the DESKTOP_SESSION and XDG_SESSION_DESKTOP environment variables
    QByteArray desktopSession = qgetenv("DESKTOP_SESSION");
    QByteArray xdgSessionDesktop = qgetenv("XDG_SESSION_DESKTOP");

    if (!desktopSession.isEmpty()) {
        qDebug() << "Desktop session:" << desktopSession;
    }

    if (!xdgSessionDesktop.isEmpty()) {
        qDebug() << "XDG session desktop:" << xdgSessionDesktop;
    }

    QString compositor;

    // Potential common compositors, including Hyprland
    QStringList knownCompositors = {"weston", "kwin_wayland", "sway", "gnome-shell", "compton", "mutter", "hyprland"};

    // Get the list of all running processes
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
