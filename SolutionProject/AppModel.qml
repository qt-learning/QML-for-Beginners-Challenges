// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick

ListModel {
    id: appModel

    ListElement {
        appName: "Home"
        appColor: "red"
        appIcon: "images/home.svg"
    }
    ListElement {
        appName: "Media"
        appColor: "green"
        appIcon: "images/play.svg"
    }
    ListElement {
        appName: "Feeds"
        appColor: "blue"
        appIcon: "images/rss.svg"
    }
    ListElement {
        appName: "Settings"
        appColor: "cyan"
        appIcon: "images/settings.svg"
    }
    ListElement {
        appName: "Calendar"
        appColor: "yellow"
        appIcon: "images/table.svg"
    }
    ListElement {
        appName: "Terminal"
        appColor: "magenta"
        appIcon: "images/terminal.svg"
    }
}
