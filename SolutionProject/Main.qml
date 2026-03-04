// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick

Window {
    width: 800
    height: 600
    visible: true
    title: qsTr("EQ Meter")

    /*

    The requirements for this challenge can be broken down into
    three steps:

    1) First make a suitable LED-style element, quite small,
    that needs to be the individual visual unit in the LED bar.
    Each LED should define its own level threshold above which
    it turns on and below which it turns off.

    2) Next, make the LED bar. Decide the bar's orientation and
    how many LEDs you want in your bar. Arrange the LEDs to fill
    the bar. The LED bar should define the level for the whole
    bar, so that each of the LEDs in the bar can decide if that
    level passes their individual thresholds or not.
    You should consider this the first time you need a model,
    a delegate and a View or a Repeater with a Layout.

    3) Finally, complete the graphic equaliser display that shows
    multiple bars, each with their own level. Define a model that
    contains level data at each index which should generate some
    random level data at a given interval. Choose a suitable View
    to create LED Bar delegates and ensure that each delegate
    reads its respective frequency level out of the model.

    */

    color: "black"

    FrequencyBandModel {
        id: frequencyBandModel
    }

    LEDMeter {
        id: ledMeter

        anchors.fill: parent
        model: frequencyBandModel
    }
}
