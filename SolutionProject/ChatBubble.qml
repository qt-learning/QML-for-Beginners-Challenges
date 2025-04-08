import QtQuick.Controls.Basic

Label {
    id: root

    required property bool me
    required text

    padding: 8
    wrapMode: Label.Wrap

    // we adjust the background width by the wrapped text width
    rightInset: width - contentWidth - padding * 2

    background: GradientBackground {
        color: root.me ? Backend.myColor : Backend.theirColor
    }
}
