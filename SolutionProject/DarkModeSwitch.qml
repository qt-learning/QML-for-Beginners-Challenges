// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls.Basic // explicit compile-time style selection
import QtQuick.Layouts

RowLayout {
    spacing: 0

    Image {
        // Use explicit URL resolution in Image source and also in all
        // other URL-type properties to resolve the URL to the base URL
        // of this QML component.
        source: Theme.darkMode ? Qt.resolvedUrl("images/lightModeWhite") :
                                 Qt.resolvedUrl("images/lightModeBlack")

        Layout.alignment: Qt.AlignLeft

        TapHandler {
            onTapped: Theme.darkMode = false
        }
    }

    Switch {
        checked: Theme.darkMode

        Layout.fillWidth: true

        // Use UI interaction properties rather than visual properties
        // when responding to UI interactions
        onClicked: Theme.darkMode = checked
    }

    Image {
        // Use explicit URL resolution in Image source and also in all
        // other URL-type properties to resolve the URL to the base URL
        // of this QML component.
        source: Theme.darkMode ? Qt.resolvedUrl("images/darkModeWhite") :
                                 Qt.resolvedUrl("images/darkModeBlack")

        Layout.alignment: Qt.AlignRight

        TapHandler {
            onTapped: Theme.darkMode = true
        }
    }
}
