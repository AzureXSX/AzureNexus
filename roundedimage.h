#ifndef ROUNDEDIMAGE_H
#define ROUNDEDIMAGE_H

#include <QImage>
#include <QObject>
#include <QPainter>
#include <QPainterPath>
#include <QPixmap>
#include <QQuickPaintedItem>

class RoundedImage : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QString source READ source WRITE setSource NOTIFY sourceChanged)

public:
    explicit RoundedImage(QQuickPaintedItem *parent = nullptr);

    QString source() const;
    void setSource(const QString &source);

    void paint(QPainter *painter) override;

signals:
    void sourceChanged();

private:
    QString m_source;
};

#endif // ROUNDEDIMAGE_H
