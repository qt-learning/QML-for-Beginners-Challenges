import QtQuick

Image {
    source: Theme.darkMode ? "images/settingsWhite" :
                             "images/settingsBlack"

    TapHandler {
        onTapped: drawer.opened ? drawer.close() :
                                  drawer.open()
    }
}
