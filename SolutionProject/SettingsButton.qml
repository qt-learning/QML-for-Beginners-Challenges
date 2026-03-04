// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick

Image {
    id: root

    // add a signal that can be handled outside this component's scope where the
    // onward items should be available to reference.
    signal clicked()

    // Use explicit URL resolution in Image source and also in all
    // other URL-type properties to resolve the URL to the base URL
    // of this QML component.
    source: Theme.darkMode ? Qt.resolvedUrl("images/settingsWhite") :
                             Qt.resolvedUrl("images/settingsBlack")

    TapHandler {
        // instead of calling out to the drawer located outside this component,
        // we simply have our component emit its own clicked signal.
        onTapped: root.clicked()
    }
}
