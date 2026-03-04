// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick

Rectangle {
    id: root

    radius: 8
    border.color: root.color

    gradient: Gradient {
        GradientStop {
            position: 0
            color: root.color.lighter()
        }
        GradientStop {
            position: 1
            color: root.color
        }
    }
}
