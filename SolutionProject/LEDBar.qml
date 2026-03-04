// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts

ColumnLayout {
    id: root

    // how many LEDs for each LEDBar
    property int ledsPerBar: 50

    // this gets the volumeLevel property from the JSON in the EqualiserModel
    required property real volumeLevel

    // width and height can be set externally but we give a nominal size here
    width: 20
    height: 100

    // vertical spacing between the LEDs
    spacing: 1

    Repeater {
        model: root.ledsPerBar

        LED {
            required property int index

            // The LEDs are automatically sized to fit within the
            // ColumnLayout's width and height taking the spacing into account
            Layout.fillWidth: true
            Layout.fillHeight: true

            // threshold is the value above which the LED will turn on
            threshold: 1 - index / root.ledsPerBar

            // the LEDBar volumeLevel is passed in and tested against the
            // threshold for turning the LED on or off.
            volumeLevel: root.volumeLevel
        }
    }
}
