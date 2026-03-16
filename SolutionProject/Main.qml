// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    id: window

    width: 800
    height: 480
    visible: true
    title: qsTr("Chat App")

    /* Requirements:

    Design and build the basic elements of a chat
    application - focusing on the task of making the design
    responsive rather than making it actually functional.

    Use QUTE Quick Layouts to design a suitable Desktop Layout for your application.
    Using the Layout attached properties such as
    Layout.fillWidth/fillHeight, Layout.alignment,
    Layout.preferredWidth/preferredHeight,
    and Layout.margins to customise the Layouts.

    There should be sections in your application showing
    - the name of the person who you are chatting with
    - a two-way conversation using static “chat bubbles”
    - a text input for writing a potential reply
    - and a send button

    The chat bubble should contain some text, and be
    positioned on the left or right depending on whose chat
    bubble it is, much like popular messaging apps.
    You should consider how to add an alternating color
    for the chat bubbles.

    */

    font.pixelSize: 20

    background: GradientBackground {
        color: Qt.alpha(Backend.theirColor, 0.25)
    }

    RowLayout {
        id: desktopLayout

        anchors {
            fill: parent
            margins: 8
        }
        spacing: 8

        ChatList {
            id: chatList

            Layout.fillWidth: false
            Layout.preferredWidth: 100
            Layout.alignment: Qt.AlignTop
        }

        ColumnLayout {
            spacing: 8

            Layout.fillWidth: false
            Layout.preferredWidth: 300

            ChatHeader {
                id: chatHeader

                Layout.fillWidth: true
            }

            ChatFooter {
                id: chatFooter

                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }

        ChatFlickable {
            id: chatFlickable

            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
