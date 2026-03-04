// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick

Item {
    id: activeLayer

    required property Item inactiveLayer

    QtObject {
        id: _private

        property AppWindow activeAppWindow: null
    }

    function makeActive(appWindow: AppWindow) {

        if(_private.activeAppWindow &&
                _private.activeAppWindow !== appWindow) {

            // demote the previous activeAppWindow to the
            // inactiveLayer. This moves it on top of all the
            // other AppWindows in the inactiveLayer
            // ensuring the stacking order remains the same
            // for this AppWindow
            _private.activeAppWindow.parent = inactiveLayer
        }

        // promote this AppWindow to the activeLayer
        // now it hasn't got anything in it
        // which puts it on top of all the others.
        appWindow.parent = activeLayer

        // store the activeAppWindow as the new activeWindow so
        // it can be demoted in subsequent calls to makeActive
        _private.activeAppWindow = appWindow

        // the new activeLayer AppWindow should grab focus
        // (all other AppWindows lose focus when this happens)
        appWindow.focus = true
    }
}
