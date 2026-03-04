// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#ifndef CHAPTER_H
#define CHAPTER_H

#include <QObject>
#include <QQmlEngine>

class Chapter : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    // REQUIRED properties behave the same way as QML required properties when used in QML
    // Make sure all your Q_PROPERTYs used in QML have the FINAL attribute.
    Q_PROPERTY(QString title READ title WRITE setTitle NOTIFY titleChanged REQUIRED FINAL)
    Q_PROPERTY(QString text READ text WRITE setText NOTIFY textChanged REQUIRED FINAL)

public:
    explicit Chapter(QObject *parent = nullptr);

    QString title() const;
    void setTitle(const QString &title);

    QString text() const;

    void setText(const QString &text);

signals:
    void titleChanged();
    void textChanged();

private:
    QString m_title;
    QString m_text;
};

#endif // CHAPTER_H
