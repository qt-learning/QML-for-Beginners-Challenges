pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts

Item {
    id: root

    signal makeActive(AppWindow appWindow)

    Rectangle {
        id: background

        anchors.fill: parent

        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#00000000"
            }
            GradientStop {
                position: 1
                color: "#88AAAAAA"
            }
        }
        transform: Rotation {
            axis {
                x: 1
                y: 0
                z: 0
            }
            origin {
                x: background.width / 2
                y: background.height
            }
            angle: 60
        }
    }

    Component {
        id: appWindowComponent

        AppWindow {
            id: appWindow

            // this requires pragma ComponentBehavior: Bound
            onMakeActive: root.makeActive(appWindow)
        }
    }

    AppModel {
        id: appModel
    }

    RowLayout {
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            bottomMargin: 16
        }
        spacing: 24

        Repeater {
            model: appModel

            AppMenuItem {

                Layout.alignment: Qt.AlignBottom

                onClicked: {
                    appWindowComponent.createObject(root, {
                                                        title: appName,
                                                        appColor: appColor,
                                                        appIcon: appIcon
                                                    })
                }
            }
        }
    }
}
