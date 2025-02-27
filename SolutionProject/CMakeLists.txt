cmake_minimum_required(VERSION 3.16)

project(IntroToQtQuickControls_SolutionProject VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appIntroToQtQuickControls
    main.cpp
)

qt_add_qml_module(appIntroToQtQuickControls
    URI IntroToQtQuickControls
    VERSION 1.0
    QML_FILES
        Main.qml
        MenuLabel.qml
        MenuSection.qml
    RESOURCES
        images/curry.jpg
        images/light/cart_add.svg
        images/light/cart_remove.svg
        images/light/checkout.svg
        images/light/mild.svg
        images/light/very_hot.svg
        fonts/Kalam-Regular.ttf
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appIntroToQtQuickControls PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appIntroToQtQuickControls
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appIntroToQtQuickControls
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appIntroToQtQuickControls
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
