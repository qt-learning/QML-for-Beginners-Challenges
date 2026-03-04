// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import QtQuick.Effects

Page {
    id: appWindow

    property color appColor: "white"
    property alias appIcon: appIcon.source
    property int windowState: AppWindow.Closed
    property int animationDuration: 250

    enum WindowState {
        Closed,
        Normal,
        Maximised
    }

    signal makeActive

    Component.onCompleted: {
        // change the windowState and make it active
        appWindow.windowState = AppWindow.Normal
        appWindow.makeActive()
    }

    TapHandler {
        // simply bring this window to the front
        // by making it active
        onTapped: appWindow.makeActive()
        // this prevents tapping through other AppWindows
        gesturePolicy: TapHandler.WithinBounds
    }

    // intitial properties before any State changes
    // - these properties represent the "closed" state
    x: parent.width / 2 - width / 2
    y: parent.height / 2 - height / 2
    width: 640
    height: 480

    scale: 0
    opacity: 0

    background: RectangularShadow {
        // RectangularShadow requires Qt 6.9
        // but a similar effect can be achieved
        // by using MultiEffect (from Qt 6.5).

        color: "black"
        radius: 16
        blur: appWindow.activeFocus ? 32 : 16
        cached: true
        spread: 0
        offset {
            x: 4
            y: 4
        }

        Rectangle {
            anchors.fill: parent
            color: "black"
            radius: 8
        }

        Rectangle {
            anchors.fill: parent
            color: appWindow.appColor
            opacity: 0.5
            radius: 8
            border.color: appWindow.focus ? "grey" : "black"
        }
    }

    header: Control {
        height: 40

        // set the font and palette for this and all child Items
        // in this header

        font.pixelSize: 22

        palette {
            buttonText: "white"
            windowText: appWindow.focus ? "white" : "grey"
        }

        background: Rectangle {
            radius: 8
            color: "#88000000"
            border.color: appWindow.focus ? "grey" : "black"
        }

        Image {
            id: appIcon

            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.left
                margins: 4
            }
            fillMode: Image.PreserveAspectFit
        }

        Label {
            anchors.centerIn: parent
            text: appWindow.title
        }

        RowLayout {
            anchors {
                top: parent.top
                bottom: parent.bottom
                right: parent.right
                margins: 4
            }

            RoundButton {
                id: maximiseButton

                Layout.fillHeight: true
                Layout.preferredWidth: height
                radius: 4

                palette.button: "green"

                Rectangle {
                    // a simple rounded square

                    anchors {
                        fill: parent
                        margins: 6
                    }

                    color: "transparent"
                    radius: 2

                    border {
                        color: palette.buttonText
                        width: 2
                    }
                }

                onClicked: appWindow.toggleMaximise()
            }

            RoundButton {
                id: closeButton

                Layout.fillHeight: true
                Layout.preferredWidth: height
                radius: 4

                palette.button: "darkred"
                text: "X"
                onClicked: appWindow.windowState = AppWindow.Closed
            }
        }

        DragHandler {
            // works only in the header, but drags the whole appWindow
            // while also making it active
            target: appWindow
            onActiveChanged: if(active) appWindow.makeActive()
        }

        TapHandler {
            // double tap the header to toggle the maximise
            onDoubleTapped: appWindow.toggleMaximise()
        }
    }

    function toggleMaximise() {
        appWindow.makeActive()
        appWindow.windowState =
                appWindow.windowState === AppWindow.Normal ?
                    AppWindow.Maximised : AppWindow.Normal
    }

    states: [
        // Note: even if states look identical,
        // the Transitions between each many not be
        State {
            name: "closed"
            when: appWindow.windowState === AppWindow.Closed

            PropertyChanges {
                appWindow {
                    opacity: 0
                    scale: 0
                }
            }
        },
        State {
            name: "normal"
            when: appWindow.windowState === AppWindow.Normal

            PropertyChanges {
                appWindow {
                    opacity: 1
                    scale: 1
                }
            }
        },
        State {
            name: "maximised"
            extend: "normal" // includes all its specified changes
            when: appWindow.windowState === AppWindow.Maximised

            AnchorChanges {
                target: appWindow
                anchors {
                    // restoring anchors conveniently
                    // restores position and size
                    left: appWindow.parent.left
                    right: appWindow.parent.right
                    top: appWindow.parent.top
                    bottom: appWindow.parent.bottom
                }
            }
        }
    ]

    transitions: [
        Transition {
            from: "closed"
            to: "normal"
            // not reversible

            NumberAnimation {
                properties: "opacity, scale"
                duration: appWindow.animationDuration
                easing.type: Easing.InOutCubic
            }
        },
        Transition {
            from: "normal"
            to: "maximised"
            reversible: true

            AnchorAnimation {
                duration: appWindow.animationDuration
                easing.type: Easing.InOutCubic
            }
        },
        Transition {
            from: "*"
            to: "closed"
            // not reversible

            SequentialAnimation {
                NumberAnimation {
                    properties: "opacity, scale"
                    duration: appWindow.animationDuration
                    easing.type: Easing.InOutCubic
                }
                ScriptAction {
                    // the close animation has completed,
                    // now destroy the appWindow instance
                    script: { appWindow.destroy() }
                }
            }
        }
    ]
}
