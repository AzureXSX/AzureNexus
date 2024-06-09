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

class WaylandScreenCapture : public QWaylandCompositor
{
    Q_OBJECT
public:
    Q_INVOKABLE void init();
    Q_INVOKABLE void takeScreenShot();
    void create();
    explicit WaylandScreenCapture(QObject* parent = nullptr);
    WaylandScreenCapture();
};

#endif // WAYLANDSCREENCPATURE_H
