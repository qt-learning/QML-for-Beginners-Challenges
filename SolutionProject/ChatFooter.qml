// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Pane {
    id: root

    padding: 8

    background: GradientBackground {
        color: "grey"
    }

    ColumnLayout {
        anchors.fill: parent

        spacing: 8

        TextArea {
            id: textArea

            Layout.fillWidth: true
            Layout.fillHeight: true

            background: Rectangle {
                color: "white"
                radius: 4
            }
            placeholderText: meCheckBox.checked ? "My reply" :
                                                  "Their reply"
        }

        RowLayout {
            Layout.fillHeight: false

            CheckBox {
                id: meCheckBox

                checked: true

                background: Rectangle {
                    color: "white"
                    radius: 4
                }
            }

            Button {
                id: sendButton

                Layout.fillWidth: true

                enabled: textArea.text.length > 0

                icon {
                    color: "black"
                    source: Qt.resolvedUrl("send.svg")
                    width: 30
                    height: 30
                }

                background: GradientBackground {
                    color: sendButton.enabled ?
                           sendButton.pressed ? "grey" :
                                                "darkgrey" : "white"
                }

                onClicked: {
                    Backend.addReply(meCheckBox.checked,
                                     textArea.text)
                    textArea.clear()
                }
            }
        }
    }
}
