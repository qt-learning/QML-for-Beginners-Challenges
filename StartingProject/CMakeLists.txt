# Copyright (C) 2026 Qt Group.
# SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

cmake_minimum_required(VERSION 3.16)

project(QMLBestPractice_StartingProject VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(QT_QML_GENERATE_QMLLS_INI TRUE)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appQMLBestPractice
    main.cpp
)

set_source_files_properties(
    Theme.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(appQMLBestPractice
    URI QMLBestPractice
    VERSION 1.0
    DEPENDENCIES
        QtQuick
    QML_FILES
        Book.qml
        BookPage.qml
        DarkModeSwitch.qml
        FontSizeSlider.qml
        GreatNightIn.qml
        Main.qml
        SettingsButton.qml
        Theme.qml
    SOURCES
        Chapter.h
        Chapter.cpp
    RESOURCES
        images/lightModeWhite.svg
        images/lightModeBlack.svg
        images/darkModeBlack.svg
        images/darkModeWhite.svg
        images/settingsBlack.svg
        images/settingsWhite.svg
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appQMLBestPractice PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appQMLBestPractice
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
    QT_QMLCACHEGEN_ARGUMENTS "--verbose"
)

target_link_libraries(appQMLBestPractice
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appQMLBestPractice
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
