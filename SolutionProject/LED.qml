import QtQuick

Rectangle {
    id: root

    property real threshold: 0
    property real volumeLevel: 0

    // nominal size
    implicitWidth: 20
    implicitHeight: 10

    radius: Math.min(height, width) / 4

    opacity: volumeLevel > threshold ? 1 : 0

    color: Qt.hsla(threshold, 1, 0.5, 1)

    Behavior on opacity {
        OpacityAnimator {
            duration: 100
            easing.type: Easing.InOutSine
        }
    }
}
