// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

pragma Singleton

import QtQuick

QtObject {
    property bool darkMode: true

    readonly property var foreground: darkMode ? "white" : "black"
    readonly property var background: darkMode ? "black" : "white"

    function updateBodyPixelSize(pixelSize) {
        body.pixelSize = pixelSize
    }

    property font title: {
        "family": "Arial",
        "pixelSize": 32
    }
    property font heading1: {
        "family": "Arial",
        "pixelSize": 24
    }
    property font body: {
        "family": "Times New Roman",
        "pixelSize": 16
    }
}
