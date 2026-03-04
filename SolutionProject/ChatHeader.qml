// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick.Controls.Basic

Pane {
    id: root

    padding: 8

    background: GradientBackground {
        color: "grey"
    }

    Label {
        anchors.centerIn: parent
        text: `Chatting with ${Backend.chattingWith}`
    }
}
