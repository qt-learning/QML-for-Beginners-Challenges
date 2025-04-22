pragma ComponentBehavior: Bound
import QtQuick

ListView {
    id: root

    orientation: ListView.Horizontal
    spacing: 1

    delegate: LEDBar {
        // scale the width of each LEDBar so they will all fit within the ListView width
        // taking the spacing into account
        width: (ListView.view.width - (root.spacing * (root.count - 1))) / root.count
        height: ListView.view.height
    }
}
