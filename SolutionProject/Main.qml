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

    // we choose "silver" as our starting themeColor
    // but we will look at how we can change this later.
    property color themeColor: "silver"

    /* Here are a few components you can use to get you going */

    component BorderGradient: Rectangle {
        id: borderGradientRectangle

        // BorderGradient:
        // A simple Rectangle with a 2-color gradient

        // We use the Rectangle's own color property as
        // the first gradient stop color (so we upgrade the
        // color property to a required property)
        required color
        property color color2: borderGradientRectangle.color.darker()

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

        color: window.themeColor

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

    // Here we have added some extra components for the design:

    component KeyButton: Button {

        // A Button whose width is calculated especially to
        // ensure four of these Buttons will fit in a row.
        // ((window.width - margin either side (20),
        // minus 3 * spacing (4)) / numButtons (4) = 47

        width: 47
        height: 40
    }

    component DoubleButton: DoubleBorderGradient {
        id: doubleButton

        // A new kind of button with two separate click areas
        // with upClicked and downClicked signals respectively.
        // It also supports two separate up and down images.

        signal upClicked
        signal downClicked

        readonly property alias upPressed: upMouseArea.pressed
        readonly property alias downPressed: downMouseArea.pressed

        property alias upImageSource: upImage.source
        property alias downImageSource: downImage.source

        height: 180
        width: 50
        radius: Math.min(width, height) / 2

        // while doubleButton has two clickable areas,
        // it visually responds as a single button
        color: upPressed || downPressed ? window.themeColor : window.themeColor.darker()
        color2: upPressed || downPressed ? window.themeColor.darker() : window.themeColor

        MouseArea {
            id: upMouseArea

            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                bottom: parent.verticalCenter
            }
            onClicked: doubleButton.upClicked()
        }

        MouseArea {
            id: downMouseArea

            anchors {
                top: parent.verticalCenter
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            onClicked: doubleButton.downClicked()
        }

        Image {
            id: upImage
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 20
            }
            width: 32
            height: 32
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: downImage
            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
                bottomMargin: 20
            }
            width: 32
            height: 32
            fillMode: Image.PreserveAspectFit
        }
    }

    QtObject {
        id: tvControl

        // The tvControl object is provided for you to use as a
        // mock back-end providing a number of typical properties
        // and features you might find on a remote control.
        // There are even 5 channels with sample channelNames.

        property int channelNumber: 0
        readonly property string channelNumberString: `Channel ${channelNumber.toString().padStart(2,"0")}`
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

    // Use a FontLoader to load a font into the application.
    // You can then use this font anywhere in the QML file.
    FontLoader {
        id: silkscreenFont
        source: Qt.resolvedUrl("fonts/Silkscreen/Silkscreen-Regular.ttf")
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
    // We also added a "power" icon for realism
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

        Image {
            anchors.centerIn: parent
            width: 20
            height: 20
            source: Qt.resolvedUrl("images/power.svg")
            fillMode: Image.PreserveAspectFit
        }
    }

    // Our first visual item will be a simple LCD screen
    // which we will use to show the channel information,
    // icons for the TV Features and a volume control indicator.
    DoubleBorderGradient {
        id: lcdScreen

        anchors {
            top: powerButton.bottom
            left: parent.left
            right: parent.right
            margins: 20
        }

        height: 100
        radius: 8
        color: "#93AA4B" // LCD Green
        innerMargin: 1 // a small relief around the edges

        Item {
            id: lcdContentItem

            // This LCD Content Item provides a simple container
            // with a margin that all child Items can align to

            anchors {
                fill: parent
                margins: 10
            }

            // a little opacity here makes any black-colored
            // Items such as text and icons look more "realistic"
            // on the LCD screen.
            opacity: 0.5

            Rectangle {
                id: volumeIndicator

                // a very simple vertical "progress bar" made out of
                // a fixed size outer Rectangle, and a smaller one
                // inside which changes its height based on a value
                // (conveniently normalised between 0 to 1)

                anchors {
                    top: parent.top
                    bottom: parent.bottom
                    right: parent.right
                }

                width: 12
                color: "transparent"
                border {
                    color: "black"
                    width: 2
                }

                Rectangle {
                    id: volumeValue

                    // A Rectangle Box indicating the volume level
                    // by filling in the area from the bottom up.

                    anchors.bottom: parent.bottom
                    color: "black"
                    width: volumeIndicator.width
                    height: volumeIndicator.height * tvControl.volume
                    opacity: tvControl.muted ? 0.5 : 1
                }
            }

            Text {
                id: channelNumberText

                // Provide a small Text box to show the
                // channelNumber using our special font
                // anchored between the left of the lcdContentItem
                // and the right of the volumeIndicator.

                anchors {
                    top: parent.top
                    // just because the font doesn't start
                    // at the top of the Text box
                    topMargin: -8
                    left: parent.left
                    right: volumeIndicator.left
                    rightMargin: 4
                }

                font {
                    // Here we are using the font we loaded with
                    // the FontLoader by using its font.family
                    family: silkscreenFont.font.family
                    pixelSize: 20
                }

                text: tvControl.channelNumberString
                color: "black"
            }

            Text {
                id: channelName

                // Provide another small Text box to show the
                // channelName again using our special font
                // anchored between the left of the lcdContentItem
                // and the right of the volumeIndicator and
                // underneath the channelNumberText.

                anchors {
                    top: channelNumberText.bottom
                    left: parent.left
                    right: volumeIndicator.left
                    rightMargin: 4
                }

                font {
                    // Again using the same font we loaded with
                    // the FontLoader by using its font.family
                    family: silkscreenFont.font.family
                    pixelSize: 16
                }

                text: tvControl.channelName
                color: "black"
            }

            // Now we add a few icons that will show whenever
            // the matching tvObject feature is enabled.

            Image {
                id: closedCaptionsIcon

                anchors {
                    bottom: parent.bottom
                    left: parent.left
                }
                width: 32
                height: 32
                visible: tvControl.closedCaptionsEnabled
                source: Qt.resolvedUrl("images/closed_caption.svg")
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: hdrEnabledIcon

                anchors {
                    bottom: parent.bottom
                    left: closedCaptionsIcon.right
                    leftMargin: 2
                }
                width: 32
                height: 32
                visible: tvControl.hdrEnabled
                source: Qt.resolvedUrl("images/hdr_on.svg")
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: castConnectedIcon

                anchors {
                    bottom: parent.bottom
                    left: hdrEnabledIcon.right
                    leftMargin: 2
                }
                width: 32
                height: 32
                visible: tvControl.castConnected
                source: Qt.resolvedUrl("images/cast_connected.svg")
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: listeningIcon

                anchors {
                    bottom: parent.bottom
                    left: castConnectedIcon.right
                    leftMargin: 2
                }
                width: 32
                height: 32
                // not visible to start with - it starts blinking
                // when we press the "mic" button
                visible: false
                source: Qt.resolvedUrl("images/mic.svg")
                fillMode: Image.PreserveAspectFit

                Timer {
                    interval: 500
                    repeat: true
                    running: tvControl.listening
                    onTriggered: listeningIcon.visible = !listeningIcon.visible
                    triggeredOnStart: true
                    onRunningChanged: if(!running) listeningIcon.visible = false
                }
            }

            Image {
                id: muteIcon

                anchors {
                    bottom: parent.bottom
                    left: listeningIcon.right
                    leftMargin: 2
                }
                width: 32
                height: 32
                source: Qt.resolvedUrl(`images/speaker${tvControl.soundOn ? "" : "_muted"}.svg`)
                fillMode: Image.PreserveAspectFit
            }
        }
    }

    Item {
        id: featureButtons

        // the feature icons that we just added above need to have
        // their respective features enabled or disabled in the
        // tvObject. Here are some Buttons that do exactly that.

        anchors {
            top: lcdScreen.bottom
            topMargin: 20
            left: parent.left
            right: parent.right
            leftMargin: 20
            rightMargin: 20
        }
        height: 40

        KeyButton {
            id: ccButton

            anchors {
                left: parent.left
            }

            onClicked: tvControl.closedCaptionsEnabled = !tvControl.closedCaptionsEnabled

            Image {
                anchors.centerIn: parent
                width: 24
                height: 24
                source: Qt.resolvedUrl("images/closed_caption_white.svg")
                fillMode: Image.PreserveAspectFit
            }
        }

        KeyButton {
            id: hdrButton

            anchors {
                left: ccButton.right
                leftMargin: 4
            }

            onClicked: tvControl.hdrEnabled = !tvControl.hdrEnabled

            Image {
                anchors.centerIn: parent
                width: 24
                height: 24
                source: Qt.resolvedUrl("images/hdr_on_white.svg")
                fillMode: Image.PreserveAspectFit
            }
        }

        KeyButton {
            id: castButton

            anchors {
                left: hdrButton.right
                leftMargin: 4
            }

            onClicked: tvControl.castConnected = !tvControl.castConnected

            Image {
                anchors.centerIn: parent
                width: 24
                height: 24
                source: Qt.resolvedUrl("images/cast_white.svg")
                fillMode: Image.PreserveAspectFit
            }
        }

        KeyButton {
            id: muteButton

            anchors {
                left: castButton.right
                leftMargin: 4
            }

            onClicked: tvControl.muted = !tvControl.muted

            Image {
                anchors.centerIn: parent
                width: 24
                height: 24
                source: Qt.resolvedUrl("images/speaker_muted_white.svg")
                fillMode: Image.PreserveAspectFit
            }
        }
    }

    Item {
        id: dpad

        /* the DPad requires a little explanation:
            It comprises four overlapping CircleButtons -
            each rotated by 45 degrees, and then clipping a
            different quarter of each one.
            Two separator lines added, before everything is
            rotated back -45 degrees to get "diagonal" buttons
            but with a corrected vertical gradient.
            Finally the center CircleButton is added on top.
        */

        anchors {
            top: featureButtons.bottom
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }

        // the width and height are the same as one CircleButton
        width: 200
        height: 200

        Item {
            id: rotatedButtons

            anchors.fill: parent

            // we use this Item to reverse-rotate all the clipped
            // CircleButtons contained here:

            rotation: 45

            Item {
                id: topButton

                // each of these clipping items is one-quarter of
                // the size of a CircleButton. In each case, the
                // child CircleButton is offset into one of the
                // four quarters as shown in each anchor binding.
                width: 100
                height: 100

                anchors {
                    left: parent.left
                    top: parent.top
                }

                clip: true

                CircleButton {
                    rotation: -45

                    Image {
                        anchors {
                            top: parent.top
                            topMargin: 10
                            horizontalCenter: parent.horizontalCenter
                        }
                        width: 32
                        height: 32
                        source: Qt.resolvedUrl("images/settings.svg")
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }

            Item {
                id: rightButton

                //visible: false

                anchors {
                    right: parent.right
                    top: parent.top
                }

                width: 100
                height: 100

                clip: true

                CircleButton {
                    anchors.horizontalCenter: parent.left
                    rotation: -45

                    Image {
                        anchors {
                            right: parent.right
                            rightMargin: 10
                            verticalCenter: parent.verticalCenter
                        }
                        width: 32
                        height: 32
                        source: Qt.resolvedUrl("images/fast_forward.svg")
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }

            Item {
                id: bottomButton

                //visible: false

                anchors {
                    right: parent.right
                    bottom: parent.bottom
                }

                width: 100
                height: 100

                clip: true

                CircleButton {
                    anchors {
                        horizontalCenter: parent.left
                        verticalCenter: parent.top
                    }
                    rotation: -45

                    Image {
                        anchors {
                            bottom: parent.bottom
                            bottomMargin: 10
                            horizontalCenter: parent.horizontalCenter
                        }
                        width: 32
                        height: 32
                        source: Qt.resolvedUrl("images/play_pause.svg")
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }

            Item {
                id: leftButton

                //visible: false

                anchors {
                    left: parent.left
                    bottom: parent.bottom
                }

                width: 100
                height: 100

                clip: true

                CircleButton {
                    anchors {
                        horizontalCenter: parent.right
                        verticalCenter: parent.top
                    }
                    rotation: -45

                    Image {
                        anchors {
                            left: parent.left
                            leftMargin: 10
                            verticalCenter: parent.verticalCenter
                        }
                        width: 32
                        height: 32
                        source: Qt.resolvedUrl("images/fast_rewind.svg")
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }

            Rectangle {
                // a horizontal line (rotated by 45 degrees)

                //visible: false

                anchors {
                    left: parent.left
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                    margins: 2
                }

                height: 2
                color: window.themeColor
                opacity: 0.5

                Rectangle {
                    y: 1
                    width: parent.width
                    height: 2
                    color: window.themeColor.darker()
                }
            }

            Rectangle {
                // a vertical line (rotated by 45 degrees)

                //visible: false

                anchors {
                    top: parent.top
                    bottom: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    margins: 2
                }
                width: 2
                color: window.themeColor
                opacity: 0.5

                Rectangle {
                    x: -1
                    height: parent.height
                    width: 2
                    color: window.themeColor.darker()
                }
            }
        }

        CircleButton {
            id: centerButton

            //visible: false

            // To complete the DPad, we add CircleButton
            // right in the center; it needs no rotation
            anchors.centerIn: parent
            width: 100
            height: 100
            onClicked: tvControl.listening = !tvControl.listening

            Image {
                anchors.centerIn: parent
                width: 48
                height: 48
                source: Qt.resolvedUrl("images/mic_white.svg")
                fillMode: Image.PreserveAspectFit
            }
        }
    }

    // the channel up/down and volume up/down buttons are both
    // based on the DoubleButton component and are identical
    // in design and mirrored position (left and right of center)
    // and have image and signal handler customisations.

    DoubleButton {
        id: channelButton

        anchors {
            top: dpad.bottom
            topMargin: 20
            left: parent.left
            leftMargin: 44 // centered between the two left most theme buttons
        }

        onUpClicked: tvControl.incrementChannel()
        onDownClicked: tvControl.decrementChannel()

        upImageSource: Qt.resolvedUrl("images/plus.svg")
        downImageSource: Qt.resolvedUrl("images/minus.svg")
    }

    DoubleButton {
        id: volumeButton

        anchors {
            top: dpad.bottom
            topMargin: 20
            right: parent.right
            rightMargin: 44 // centered between the two left most theme buttons
        }

        onUpClicked: tvControl.incrementVolume()
        onDownClicked: tvControl.decrementVolume()

        upImageSource: Qt.resolvedUrl("images/volume_up.svg")
        downImageSource: Qt.resolvedUrl("images/volume_down.svg")
    }
}
