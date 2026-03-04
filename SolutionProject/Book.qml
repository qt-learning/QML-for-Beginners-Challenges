// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick

QtObject {
    required property string title
    // The Book Type has a list of Chapter objects,
    // so make sure the list property is typed as such
    default property list<Chapter> chapters
}
