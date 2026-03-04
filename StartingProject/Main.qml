// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("FluidAnimations")

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
}
