#include "roundedimage.h"

RoundedImage::RoundedImage(QQuickPaintedItem *parent)
    : QQuickPaintedItem(parent)
{}

QString RoundedImage::source() const
{
    return m_source;
}

void RoundedImage::setSource(const QString &source)
{
    if (m_source == source)
        return;

    m_source = source;
    update();
    emit sourceChanged();
}

void RoundedImage::paint(QPainter *painter)
{
    if (m_source.isEmpty())
        return;

    QPixmap pixmap(m_source);
    if (pixmap.isNull())
        return;

    QSize size = boundingRect().size().toSize();
    QPixmap scaledPixmap = pixmap.scaled(size, Qt::KeepAspectRatio, Qt::SmoothTransformation);

    QPainterPath path;
    path.addRoundedRect(boundingRect(), 150, 150);
    painter->setClipPath(path);
    painter->drawPixmap(0, 0, scaledPixmap);
}
