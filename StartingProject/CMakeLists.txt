cmake_minimum_required(VERSION 3.16)

project(IntroToQtQuick_StartingProject VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appIntroToQtQuick
    main.cpp
)

qt_add_qml_module(appIntroToQtQuick
    URI IntroToQtQuick
    VERSION 1.0
    QML_FILES
        Main.qml
    RESOURCES
    RESOURCES fonts/Silkscreen/Silkscreen-Bold.ttf fonts/Silkscreen/Silkscreen-Regular.ttf images/cast_connected.svg images/cast_white.svg images/closed_caption.svg images/closed_caption_white.svg images/fast_forward.svg images/fast_rewind.svg images/hdr_on.svg images/hdr_on_white.svg images/mic.svg images/mic_white.svg images/minus.svg images/play_pause.svg images/plus.svg images/power.svg images/settings.svg images/speaker.svg images/speaker_muted.svg images/speaker_muted_white.svg images/volume_down.svg images/volume_up.svg
    # TODO: add the resources you want to use
    # some are provided already in the images and fonts folders
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appIntroToQtQuick PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appIntroToQtQuick
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appIntroToQtQuick
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appIntroToQtQuick
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
