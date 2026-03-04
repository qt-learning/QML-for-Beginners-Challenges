// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

pragma Singleton

import QtQuick

QtObject {
    property bool darkMode: true

    // Ensure that all properties are declared with the correct type and
    // avoid using "var" unless absolutely necessary
    // e.g. Javascript arrays and objects.
    readonly property color foreground: darkMode ? "white" : "black"
    readonly property color background: darkMode ? "black" : "white"

    // use the correct type annotations for Javascript functions
    // (the return type void can be omitted as this is assumed)
    function updateBodyPixelSize(pixelSize: int) : void {
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
