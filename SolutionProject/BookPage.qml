// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls.Basic // explicit compile-time style selection

Page {
    id: root

    // Use required properties with names that match the expected roles.
    // In this case we want to explictly require the "built-in"
    // roles of "modelData" and "index" which are of type "Chapter"
    // and "int" respectively.
    required property Chapter modelData
    required property int index

    // adding objectName for tooling such as Squish to find the
    // delegate instances. Note the use of the required propery int index here
    // such that each delegate gets a unique objectName.
    // This can be especially useful when introspecting dynamically
    // created items like this with tools like Squish
    objectName: `Page ${root.index + 1}`

    padding: 8

    header: Label {

        // We should not give the header an id such that in the event that it
        // is replaced, this header will not be created in favour of the
        // replaced header.

        leftPadding: 8

        font: Theme.heading1
        // Using string templates makes the composited string much easier to read.
        // Using qualified property references in bindings removes an ambiguity
        text: `Chapter ${root.index + 1}: ${root.modelData.title}`
    }

    Flickable {
        id: flickable

        anchors.fill: parent
        clip: true
        contentHeight: pageContent.height // free to expand
        contentWidth: pageContent.width // which is clamped to the flickable width

        Label {
            id: pageContent

            font: Theme.body
            // Using qualified property references in bindings removes an ambiguity
            text: root.modelData.text

            // Rather than using parent to qualify the width, we explicity
            // name the flickable. This ensures that the type completion is
            // correct and aid in potential refactoring.
            // This also ensures that the width we are getting
            // is from the actual Flickable!
            width: flickable.width
            wrapMode: Label.Wrap
        }
    }

    background: Rectangle {
        // no need for an ID here
        color: Theme.background
    }
}
