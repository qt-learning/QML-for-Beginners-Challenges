// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick

Image {
    source: Theme.darkMode ? "images/settingsWhite" :
                             "images/settingsBlack"

    TapHandler {
        onTapped: drawer.opened ? drawer.close() :
                                  drawer.open()
    }
}
