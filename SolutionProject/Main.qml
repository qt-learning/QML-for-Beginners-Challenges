// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    id: mainWindow

    width: 1280
    height: 800
    visible: true
    title: qsTr("FluidAnimations")
    color: "black"

    /* Requirements Summary
        Create a desktop launcher bar with icons representing
        applications on any edge of the screen.
        Ensure the icons include the name of the application.
        Animate the icons to enlarge on mouse hover,
        and return to normal size when not hovering.
        Select suitable animation to create a pleasing "wave"
        effect when the mouse hovers over it.
        Create Items representing application windows,
        suitably positioned on the desktop.
        Each Item should visually reference the application
        (icon, name, background color) and have three states:
        "closed", "open", and "maximized", caused by user actions.
        Use Transitions and AnchorChanges to animate properties
        between the state changes.
    */

    background: Image {
        source: Qt.resolvedUrl("images/wallpaper.jpg")
        fillMode: Image.PreserveAspectCrop
    }

    Item {
        id: inactiveLayer

        anchors.fill: parent
    }

    ActiveLayer {
        id: activeLayer

        anchors.fill: parent
        inactiveLayer: inactiveLayer
    }

    AppLauncher {
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
        width: parent.width * 0.75
        height: parent.height / 4

        onMakeActive: (appWindow) => {
                          activeLayer.makeActive(appWindow)
                      }
    }
}
