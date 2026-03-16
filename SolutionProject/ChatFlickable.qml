// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Layouts

Flickable {
    id: root

    contentHeight: chatColumnLayout.height
    contentWidth: chatColumnLayout.width

    clip: true

    ColumnLayout {
        id: chatColumnLayout

        width: root.width
        spacing: 8

        Repeater {
            model: Backend.chat

            ChatBubble {
                // My messages are on the left; theirs are on the right
                Layout.alignment: me ? Qt.AlignRight : Qt.AlignLeft

                // let the bubble be as small as the longest text line when NOT wrapped
                Layout.maximumWidth: parent.width * 0.75

                // adjustment for the text wrapping
                Layout.rightMargin: -rightInset
            }
        }
    }

    Binding {
        root.contentY: root.contentHeight - root.height
        when: root.height < root.contentHeight
    }
}
