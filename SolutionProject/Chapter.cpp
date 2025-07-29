#include "Chapter.h"

Chapter::Chapter(QObject *parent)
    : QObject{parent}
{}

QString Chapter::title() const
{
    return m_title;
}

void Chapter::setTitle(const QString &title)
{
    if (m_title == title) {
        return;
    }
    m_title = title;
    emit titleChanged();
}

QString Chapter::text() const
{
    return m_text;
}

void Chapter::setText(const QString &text)
{
    if (m_text == text) {
        return;
    }
    m_text = text;
    emit textChanged();
}
