pragma ComponentBehavior: Bound
// for permitting access to window.themeColor
// from inside any component declarations in this file

import QtQuick

Window {
    id: window

    /* Your solution should contain these key features:

    - Add a Window with dimensions which resemble the kind of
      remote control shape you want

    - Using components from the Qt Quick module such as Text,
      Image, Rectangle and any other components you want to use
      in your design, construct your shape, colors and layout of
      the elements you need.

    - You should include a number of Buttons providing features
      such as Volume +/-, Mute, Channel +/-, Power on/off, and
      perhaps even some cursor arrows.

    - Add image resources to your project and use them in your
      design and try to show how the image URL might be changed
      using bindings inside a string template expression.

    - Add a font to your project and use a FontLoader to be able
      to use the font in your Text components.

    - Create re-usable items using inline components adding any
      "required" properties where necessary

    - Using bindings and signal handlers to connect your UI
      elements to the provided tvControl object (below) so that
      interacting with your Buttons for example, could change
      the visible, enabled, or color of some of the other
      elements based on the changed state of the tvControl
      object’s properties.

    */

    // Here we have chosen a reasonable shape for your
    // remote control, but feel free to design your own.
    width: 240
    height: 740
    visible: true
    color: "black"

    // the window provides a themeColor property which you
    // may use wherever you need to refer to the same color
    property color themeColor: "silver"

    /* Here are a few components you can use to get you going */

    component BorderGradient: Rectangle {
        id: borderGradientRectangle

        // BorderGradient:
        // A simple Rectangle with a 2-color gradient

        // We use the Rectangle's own color property as
        // the first gradient stop color (so we upgrade the
        // color property to a required property)
        property color color2: borderGradientRectangle.color.darker()

        color: window.themeColor

        gradient: Gradient {
            GradientStop {
                position: 0
                color: borderGradientRectangle.color
            }
            GradientStop {
                position: 1
                color: borderGradientRectangle.color2
            }
        }
    }

    component DoubleBorderGradient: BorderGradient {
        id: doubleBorderGradient

        // DoubleBorderGradient:
        // A BorderGradient with another one nested inside
        // with a specified innerMargin

        property int innerMargin: 2

        BorderGradient {
            // inner gradient
            anchors {
                fill: parent
                margins: doubleBorderGradient.innerMargin
            }

            radius: doubleBorderGradient.radius - doubleBorderGradient.innerMargin

            // swap the colors around
            color: doubleBorderGradient.color2
            color2: doubleBorderGradient.color
        }
    }

    component Button: DoubleBorderGradient {
        id: button

        // Button:
        // A clickable DoubleBorderGradient with a useful
        // clicked signal and a pressed property alias

        readonly property alias pressed: tapHandler.pressed
        signal clicked

        implicitWidth: 100
        implicitHeight: 40

        radius: Math.min(width, height) / 2

        color: tapHandler.pressed ? window.themeColor : window.themeColor.darker()
        color2: tapHandler.pressed ? window.themeColor.darker() : window.themeColor

        TapHandler {
            id: tapHandler
            gesturePolicy: TapHandler.WithinBounds
            onTapped: button.clicked()
        }
    }

    component CircleButton: Button {
        id: circleButton

        // CircleButton:
        // A circular Button for convenience

        width: 200
        height: width // a circle

        // The CircleButton uses Item's containmentMask
        // property to return the boolean result of a
        // simplified test to check if the point is inside
        // the circle or not.
        containmentMask: QtObject {
            function contains(clickPoint: point) : bool {
                return (Math.pow(clickPoint.x - circleButton.radius, 2) +
                        Math.pow(clickPoint.y - circleButton.radius, 2))
                        < Math.pow(circleButton.radius, 2)
            }
        }
    }

    QtObject {
        id: tvControl

        // The tvControl object is provided for you to use as a
        // mock back-end providing a number of typical properties
        // and features you might find on a remote control.
        // There are even 5 channels with sample channelNames.

        property int channelNumber: 0
        readonly property string channelName: channelNames[channelNumber]

        // TV Features
        property bool closedCaptionsEnabled: true
        property bool hdrEnabled: true
        property bool castConnected: true
        property bool listening: false
        property bool muted: false
        property real volume: 0.75
        readonly property bool soundOn: !muted && volume > 0

        function incrementVolume() {
            volume = Math.min(1, volume + 0.1)
        }

        function decrementVolume() {
            volume = Math.max(0, volume - 0.1)
        }

        function incrementChannel() {
            channelNumber = Math.min(channelNames.length - 1, channelNumber + 1)
        }

        function decrementChannel() {
            channelNumber = Math.max(0, channelNumber - 1)
        }

        property list<string> channelNames: [
            "News Station",
            "Comedy Cable",
            "Eats and Beats",
            "Weather",
            "Cartoons",
            "Reality TV"
        ]
    }

    // Here we provide a suggested remote control background
    DoubleBorderGradient {
        id: remoteControlBackground

        anchors.fill: parent
        innerMargin: 8
        radius: 40
    }

    // As a demonstration of one of the Button types,
    // we add a power button.
    CircleButton {
        id: powerButton

        anchors {
            top: parent.top
            right: parent.right
            topMargin: 20
            rightMargin: 20
        }
        width: 40
        height: 40
        color: "darkred"

        onClicked: window.close()
    }
}
