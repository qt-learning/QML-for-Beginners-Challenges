import QtQuick.Controls.Basic

Pane {
    id: root

    padding: 8

    background: GradientBackground {
        color: "grey"
    }

    Label {
        anchors.centerIn: parent
        text: `Chatting with ${Backend.chattingWith}`
    }
}
