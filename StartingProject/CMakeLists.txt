# Copyright (C) 2026 Qt Group.
# SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

cmake_minimum_required(VERSION 3.16)

project(FluidAnimations_StartingProject VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appFluidAnimations
    main.cpp
)

qt_add_qml_module(appFluidAnimations
    URI FluidAnimations
    VERSION 1.0
    QML_FILES
        AppModel.qml
        Main.qml
    RESOURCES
        images/home.svg
        images/play.svg
        images/rss.svg
        images/settings.svg
        images/table.svg
        images/terminal.svg
        images/wallpaper.jpg
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appFluidAnimations PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appFluidAnimations
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appFluidAnimations
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appFluidAnimations
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
