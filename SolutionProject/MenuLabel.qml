import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

RowLayout {
    id: root

    property string name
    property real cost: 0
    readonly property real value: spinBox.value * cost

    Label {
        id: label
        text: `${root.name}: $${root.cost}`
        Layout.fillWidth: true
    }

    SpinBox {
        id: spinBox
    }
}
