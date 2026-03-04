// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls.Basic // explicit compile-time style selection
import QtQuick.Layouts

ApplicationWindow {
    id: window

    /* Requirements

    QML Language Features: Use Strong Typing has 3 issues:

        - Use Strongly Typed Properties by choosing better types for
          any "var" properties in the code.

        - Use Declarative Bindings Rather Than Imperative Assignments by
          considering the Javascript functions and assignments and refactoring
          the logic into declarative bindings. For example, see if you can remove
          the updateDrawerDimensions() function in Main.qml completely without
          changing the visual behavior.

        - Use Typed List Properties by ensuring any list properties are
          declared as being able to contain the correct types only.


    QML Language Features: Required Properties, and More has 4 issues:

        - Use Required Properties in Components and Delegates by updating
          unqualified uses of "model" with the correctly typed required
          property instead, making any affected binding adjustments.

        - Don’t Use ids if you don’t need them by removing any ids specifically
          on components bound to properties inside other components that
          could be replaced from outside.

        - Assign meaningful objectNames values your QML objects where you need them,
          maybe where there isn’t an id for example, but where you want to see
          the objectName in debug views or output. Delegates in a View are
          particularly good candidates for using string interpolation to make
          unique objectNames from the model index.

        - Use String Interpolation in the chapter texts to use template
          literals (backticks) instead of double quotes for better inline
          newline representation. Replace string concatenations in binding
          expressions with string templates.


    QML Language Features: Signals, States, and More

        - Use Explicit URL Resolution in any URL properties which
          should be using Qt.resolvedUrl()

        - Use Group Property Syntax in properties which could be
          better expressed with group property syntax

        - Connections Function Syntax should be used instead of
          signal handlers when possible.

        - Prefer UI Interaction Signals Over Changed Signals by
          refactoring QML signal handlers to use UI interaction signals
          instead of visual property change signals.

    ​​QML Language Features: Styling and Properties

        - Use Compile-Time Style Selection by appending a named style
          any time you import QtQuick.Controls

        - Avoid Shadowing Properties by fixing the Chapter header to make
          its properties FINAL to remove the property shadowng potential.

    Unqualified Access

        - Avoid Implicit Lookup in the Root Scope by adding the correct
          id qualifications on properties in child items which bind to
          properties of the QML document.

        - Avoid Referencing Objects Outside the Component by fixing the
          external access to the drawer inside the SettingsButton where
          its id is not available by emitting a signal for handling externally.

        - Avoid Using parent for Property Qualification by using a qualified
          id rather than using “parent” in any property binding expressions
          other than anchors.


    QML and JavaScript

        - Use Type Annotations on Functions which don’t specify any
          types for its parameters or return values.

    */

    height: 600
    width: 800
    visible: true
    title: qsTr("QML Best Practice")

    palette {
        dark: Theme.foreground
        window: Theme.background
        windowText: Theme.foreground
    }

    // The explicit style import QtQuick.Controls.Basic makes
    // sure that the ApplicationWindow and all the Qt Quick
    // Controls used here are from the Basic style, and that
    // the ApplicationWindow palette color roles are applied
    // to all the Controls as desired.

    header: RowLayout {
        spacing: 32

        SettingsButton {
            id: settingsButton

            objectName: "settingsButton"

            Layout.leftMargin: 8

            onClicked: drawer.opened ? drawer.close() : drawer.open()
        }

        Label {
            id: bookTitle

            objectName: "bookTitle"

            font: Theme.title
            text: greatNightIn.title

            Layout.fillWidth: true
        }

        FontSizeSlider {
            id: fontSizeSlider

            objectName: "fontSizeSlider"
        }

        DarkModeSwitch {
            id: darkModeSwitch

            objectName: "darkModeSwitch"

            Layout.rightMargin: 8
        }
    }

    footer: RowLayout {
        Button {
            id: previousButton

            objectName: "previousButton"

            enabled: swipeView.currentIndex > 0
            flat: true
            text: qsTr("< Previous")

            Layout.alignment: Qt.AlignLeft

            onClicked: swipeView.decrementCurrentIndex()
        }

        PageIndicator {
            id: pageIndicator

            objectName: "pageIndicator"

            count: swipeView.count
            currentIndex: swipeView.currentIndex

            Layout.alignment: Qt.AlignHCenter
        }

        Button {
            id: nextButton

            objectName: "nextButton"

            enabled: swipeView.currentIndex < swipeView.count - 1
            flat: true
            text: qsTr("Next >")

            Layout.alignment: Qt.AlignRight

            onClicked: swipeView.incrementCurrentIndex()
        }
    }

    background: Rectangle {
        color: Theme.background
    }

    GreatNightIn {
        id: greatNightIn

        objectName: "greatNightIn"
    }

    SwipeView {
        id: swipeView

        objectName: "swipeView"

        currentIndex: 0

        anchors {
            fill: parent
            topMargin: 16
        }

        Repeater {
            model: greatNightIn.chapters

            BookPage { }
        }
    }

    Drawer {
        id: drawer

        objectName: "drawer"

        // Use declarative property bindings ensures initial values are
        // set and all changes are also updated in a clean set of
        // binding expressions
        y: window.header.height
        height: window.height - window.footer.height - window.header.height
        width: window.width * 0.3

        ColumnLayout {
            anchors {
                // use group property syntax makes anchors (and other group properties
                // much easier to read and less work to maintain.
                top: parent.top
                left: parent.left
                right: parent.right
                topMargin: 8
                leftMargin: 8
                rightMargin: 8
            }

            Label {
                id: settingsLabel

                objectName: "settingsLabel"

                font: Theme.heading1
                text: qsTr("Settings")
            }

            Label {
                id: fontSizeLabel

                objectName: "fontSizeLabel"

                text: qsTr("Font Size")
            }

            FontSizeSlider {
                id: fontSizeSlider2

                objectName: "fontSizeSlider2"
            }

            Label {
                id: darkModeLabel

                objectName: "darkModeLabel"

                text: qsTr("Dark Mode")
            }

            DarkModeSwitch {
                id: darkModeSwitch2

                objectName: "darkModeSwitch2"
            }
        }
    }
}
