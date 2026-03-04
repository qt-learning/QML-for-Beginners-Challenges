// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

RowLayout {
    spacing: 0

    property string sampleLetter: "A"

    Label {
        font.pixelSize: bodyFontSlider.from
        text: sampleLetter
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

            onValueChanged: {
                Theme.updateBodyPixelSize(bodyFontSlider.value)
            }
        }
    }

    Label {
        font.pixelSize: bodyFontSlider.to
        text: sampleLetter
    }
}
