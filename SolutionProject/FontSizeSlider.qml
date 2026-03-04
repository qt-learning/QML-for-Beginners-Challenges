// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls.Basic // explicit compile-time style selection
import QtQuick.Layouts

RowLayout {
    id: root

    spacing: 0

    property string sampleLetter: "A"

    Label {
        font.pixelSize: bodyFontSlider.from
        // ensure that all context properties are correctly
        // qualified with an id
        text: root.sampleLetter
    }

    Slider {
        id: bodyFontSlider

        from: 16
        stepSize: 1
        to: 32
        value: Theme.body.pixelSize

        Layout.fillWidth: true

        Connections {
            target: bodyFontSlider

            // use the new function-based Connection syntax
            function onValueChanged() {
                Theme.updateBodyPixelSize(bodyFontSlider.value)
            }
        }
    }

    Label {
        font.pixelSize: bodyFontSlider.to
        // ensure that all context properties are correctly
        // qualified with an id
        text: root.sampleLetter
    }
}
