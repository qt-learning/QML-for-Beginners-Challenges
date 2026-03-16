// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ColumnLayout {
    id: root

    spacing: 8

    Repeater {
        id: repeater

        model: Backend.chatModel

        Button {
            id: button

            required property int index
            required property string name

            text: name

            checked: index === Backend.currentIndex
            onClicked: Backend.currentIndex = index

            Layout.fillWidth: true

            background: GradientBackground {
                color: button.checked ? "black" :
                       button.pressed ? "lightgrey" : "grey"
            }
        }
    }
}

