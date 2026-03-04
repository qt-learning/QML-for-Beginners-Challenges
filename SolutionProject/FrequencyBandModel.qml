// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick

ListModel {
    id: root

    // how often should the volumeLevel for each frequencyBand be updated
    property int interval: 50

    // The Model is JSON Array of JSON objects which has data in the form
    // [ { volumeLevel : n1 }, { volumeLevel : n2 } , ... ]

    // how many "frequency bands" do we want
    property int frequencyBands: 50

    onFrequencyBandsChanged: updateBands()

    Component.onCompleted: updateBands()

    function updateBands() {
        if(frequencyBands > root.count) {
            // add the number of bars we need
            root.addBars(frequencyBands - root.count)
        } else if(frequencyBands < root.count) {
            // remove the number of bars we need
            root.removeBars( root.count - frequencyBands)
        } else {
            // don't do anything
        }
    }

    function updateBandData() {
        for(let index = 0; index < root.count; index++) {
            const oldValue = root.get(index)["volumeLevel"]
            // newValue can go up or down by 0.1 each time
            // and is clamped between 0 and 1
            const newValue = Math.min(1, Math.max(oldValue + ((Math.random() - 0.5) * 0.1), 0))
            root.setProperty(index, "volumeLevel", newValue)
        }
    }

    function addBars(count : int) {
        for (let index = 0; index < count; index++) {
            root.append({ volumeLevel: 0 })
        }
    }

    function removeBars(count : int) {
        root.remove(root.count - count, count)
    }

    property Timer dataGenerator: Timer {

        interval: root.interval
        repeat: true
        running: root.count > 0

        onTriggered: root.updateBandData()
    }
}
