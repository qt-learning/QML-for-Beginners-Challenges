import QtQuick
import QtQuick.Controls.Basic

Rectangle {
    id: root

    required property string appName
    required property color appColor
    required property string appIcon

    property real scaleFactor: hoverHandler.hovered ? 1.5 : 1

    signal clicked

    implicitHeight: appIcon.height * scaleFactor + 4
    implicitWidth: appIcon.width * scaleFactor + 4

    color: appColor
    opacity: hoverHandler.hovered ? 1 : 0.8
    radius: 8

    HoverHandler {
        id: hoverHandler
    }

    Behavior on opacity {
        NumberAnimation {
            duration: 300
            easing.type: Easing.InOutQuad
        }
    }

    Behavior on scaleFactor {
        NumberAnimation {
            duration: 100
            easing.type: Easing.InOutSine
        }
    }

    Image {
        id: appIcon

        anchors.centerIn: parent
        width: 48
        height: 48

        source: Qt.resolvedUrl(root.appIcon)
        fillMode: Image.PreserveAspectFit

        scale: root.scaleFactor
    }

    Label {
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.top
            bottomMargin: 16
        }
        padding: 6

        color: "white"
        font.pixelSize: 14
        horizontalAlignment: Qt.AlignHCenter
        scale: root.scaleFactor
        text: root.appName

        background: Rectangle {
            color: "#33000000"
            radius: 8
        }
    }

    TapHandler {
        onTapped: root.clicked()
    }
}
