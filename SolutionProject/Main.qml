import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    id: window

    /* Your menu ordering application should contain the following:

        - A variety of Controls from the Qt Quick Controls module
          such as Page, Pane, Button, Slider, RadioButton or Dials.
        - An ApplicationWindow that has a suitably appetising background
        - A cuisine-themed font to use across your whole design.
        - A restaurant name that you can put in the ApplicationWindow header.
        - Customise the ApplicationWindow palette to adjust your Controls' colors
        - Organise your menu into visual Pages with titles for Starters, Mains and Desserts,
          listing some menu items, showing a price and a quantity selection.
        - The total cost of the selected items should be shown in the ApplicationWindow footer
        - Consider how your design could be made from re-usable components as QML Files
        - Add a Button for "submitting" the order and show a visual status that the order
          is busy being processed, and then completed. A Timer can be used to simulate this.
        - If using anchors to arrange your design becomes complex, try using
          RowLayout and ColumnLayout from the Qt Quick Layouts module.
    */

    width: 640
    height: 800
    visible: true
    title: qsTr("Ahji-Bhaji")

    background: Image {
        source: Qt.resolvedUrl("images/curry.jpg")
        fillMode: Image.PreserveAspectCrop
        opacity: 0.5
    }

    FontLoader {
        id: kalamFont
        source: Qt.resolvedUrl("fonts/Kalam-Regular.ttf")
    }

    font {
        family: kalamFont.font.family
        pixelSize: 20
    }

    Palette {
        id: lightPalette
        dark: "black"
        window: "white"
        windowText: "black"
    }

    palette: lightPalette

    header: Pane {

        padding: 8

        background: Rectangle {
            color: palette.window
            opacity: 0.5
        }

        Label {
            text: window.title
            font.pixelSize: 30
            anchors.centerIn: parent
        }
    }

    Item {
        id: menu

        readonly property real totalOrderCost: starters.subtotal +
                                               mains.subtotal +
                                               sides.subtotal +
                                               breads.subtotal +
                                               tipSlider.value

        anchors.fill: parent

        Pane {
            anchors {
                left: parent.left
                right: parent.horizontalCenter
                top: parent.top
                bottom: parent.bottom
            }

            padding: 8

            background: Rectangle {
                color: "transparent"
                border.color: palette.windowText
            }

            ColumnLayout {
                anchors.fill: parent

                MenuSection {
                    id: starters

                    title: qsTr("Starters")

                    Layout.fillWidth: true

                    item1 {
                        name: qsTr("Onion Bhaji")
                        cost: 10
                    }
                    item2 {
                        name: qsTr("Meat Samosa")
                        cost: 12
                    }
                    item3 {
                        name: qsTr("Nargis Kebab")
                        cost: 15
                    }
                }

                MenuSection {
                    id: mains

                    title: qsTr("Mains")

                    Layout.fillWidth: true

                    item1 {
                        name: qsTr("Paneer Tikka")
                        cost: 20
                    }
                    item2 {
                        name: qsTr("Lamb Bhuna")
                        cost: 25
                    }
                    item3 {
                        name: qsTr("Murgh Tikka")
                        cost: 28
                    }
                }

                Label {
                    id: spiceLevelLabel

                    text: qsTr("Spice Level")
                    font.pixelSize: 30
                }

                Dial {
                    id: spiceLevelDial

                    Layout.preferredWidth: 150
                    Layout.preferredHeight: 150
                    from: 0
                    to: 5
                    stepSize: 1
                    Layout.alignment: Qt.AlignHCenter

                    Image {
                        source: Qt.resolvedUrl(`images/light/mild.svg`)
                        anchors {
                            bottom: parent.bottom
                            right: parent.left
                        }
                    }

                    Image {
                        source: Qt.resolvedUrl(`images/light/very_hot.svg`)
                        anchors {
                            bottom: parent.bottom
                            left: parent.right
                        }
                    }
                }
            }
        }

        Pane {
            anchors {
                left: parent.horizontalCenter
                right: parent.right
                top: parent.top
                bottom: parent.bottom
            }
            padding: 8

            background: Rectangle {
                color: "transparent"
                border.color: palette.windowText
            }

            ColumnLayout {
                anchors.fill: parent

                MenuSection {
                    id: sides

                    title: qsTr("Sides")

                    Layout.fillWidth: true

                    item1 {
                        name: qsTr("Pilau Rice")
                        cost: 10
                    }
                    item2 {
                        name: qsTr("Aloo Ghobi")
                        cost: 12
                    }
                    item3 {
                        name: qsTr("Ahji Bahji")
                        cost: 15
                    }
                }

                MenuSection {
                    id: breads

                    title: qsTr("Breads")

                    Layout.fillWidth: true

                    item1 {
                        name: qsTr("Garlic Naan")
                        cost: 15
                    }
                    item2 {
                        name: qsTr("Keema Naan")
                        cost: 18
                    }
                    item3 {
                        name: qsTr("Naan at all")
                        cost: 1
                    }
                }

                Label {
                    id: diningOptionsLabel

                    Layout.fillWidth: true
                    font.pixelSize: 30
                    text: qsTr("Dining Options")
                }

                RowLayout {

                    RadioButton {
                        id: eatInRadioButton

                        text: qsTr("Eat In")
                    }

                    RadioButton {
                        id: takeawayButton

                        text: qsTr("Take away")
                    }
                }

                Label {
                    id: tipLabel

                    Layout.fillWidth: true
                    font.pixelSize: 30
                    text: qsTr("Tip Amount")
                }

                RowLayout {

                    Slider {
                        id: tipSlider

                        Layout.fillWidth: true

                        from: 0
                        to: 100
                        stepSize: 10
                        snapMode: Slider.SnapAlways
                    }

                    Label {
                        id: tipValue

                        font.pixelSize: 30
                        text: `$${tipSlider.value}`
                    }
                }
            }
        }
    }

    Pane {
        id: orderProcessing

        visible: false
        anchors.centerIn: parent
        width: window.width / 2
        height: window.height / 3

        background: Rectangle {
            color: palette.window
            border.color: palette.windowText
        }

        ColumnLayout {
            anchors.centerIn: parent

            Label {
                id: orderStatus
                text: qsTr("Processing Order: $%1").arg(menu.totalOrderCost)
                Layout.alignment: Qt.AlignHCenter
            }
            BusyIndicator {
                running: visible
                Layout.alignment: Qt.AlignHCenter
            }
        }
    }

    Pane {
        id: orderProcessed

        visible: false
        anchors.centerIn: parent
        width: window.width / 2
        height: window.height / 3

        background: Rectangle {
            color: palette.window
            border.color: palette.windowText
        }

        Label {
            text: qsTr("Order Processed!")
            anchors.centerIn: parent
        }

        TapHandler {
            onTapped: orderProcessed.visible = false
        }
    }

    Timer {
        id: orderProcessingTimer
        interval: 2000
        repeat: false
        onRunningChanged: if(running) {
                              orderProcessing.visible = true
                          }

        onTriggered: {
            orderProcessing.visible = false
            orderProcessed.visible = true
        }
    }

    footer: Pane {

        padding: 8

        background: Rectangle {
            color: palette.window
            opacity: 0.5
        }

        RowLayout {
            anchors.fill: parent

            Label {
                id: orderTotal
                text: qsTr("Total Order Cost: $%1").arg(menu.totalOrderCost)
                font.pixelSize: 30
                Layout.fillWidth: true
            }

            Button {
                id: orderButton
                text: qsTr("Order Now")
                enabled: menu.totalOrderCost > 0 &&
                         (eatInRadioButton.checked || takeawayButton.checked)
                onClicked: orderProcessingTimer.restart()
            }
        }
    }
}
