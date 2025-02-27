import QtQuick

Window {

    // standard business cards ratio is approx 1:1.586
    width: 640
    height: width / 1.586

    visible: true
    title: qsTr("Business Card")

    color: "white"

    component ContactInfo: QtObject {

        // This is a ContactInfo object which provides
        // the properties to fill in.
        // You can create as many instances of this as you
        // like with different property values.

        // show these properties all the time:
        property string name
        property url photo

        // Basic Info properties:
        property string occupation
        property string company
        property string address

        // Detailed Info properties:
        property string country
        property string phone
        property string email
        property url webSite
    }

    ContactInfo {
        id: myContactInfo

        // this is one example instance of a ContactInfo
        // inline Component showing how the properties
        // are populated.

        name: "Your Name"
        photo: Qt.resolvedUrl("IDPhoto.png")
        occupation: "QML Enthusiast"
        company: "Indie Soft"
        address: "Candy Cane Lane"
        country: "North Pole"
        phone: "+01 2345 567 890"
        email: "email@server.com"
        webSite: Qt.url("https://www.qt.io")
    }

    // Make a nice border around the window
    Rectangle {
        id: borderRectangle

        anchors {
            fill: parent
            margins: 10
        }
        color: "transparent"
        border {
            // use group property syntax
            color: "black"
            width: 2
        }
        radius: 10

        // Make an Item within the border, with a margin
        // that we can start placing content inside
        Item {
            id: borderItem

            anchors {
                // use group property syntax
                fill: parent
                margins: borderRectangle.radius
            }

            // Make a frame for the id photo
            Rectangle {
                id: photoFrame

                anchors {
                    // anchor it in the top right
                    top: parent.top
                    right: parent.right
                }

                // set the size (as a square by binding
                // the height to the width)
                width: 200
                height: width

                color: "transparent"
                border {
                    color: "black"
                    width: 2
                }
                radius: 5

                // Add the ID Photo inside the frame
                Image {
                    id: idPhoto

                    anchors {
                        fill: parent
                        margins: photoFrame.radius
                    }

                    // ensure the image fills as much of the
                    // area as possible without stretching
                    fillMode: Image.PreserveAspectFit

                    // set the image source.
                    // You can change this to whatever you
                    // like so long as the image file is
                    // added to the CMakeLists.txt file
                    // under the RESOURCES property of the
                    // qt_add_qml_module() function.
                    source: Qt.resolvedUrl("IDPhoto.png")
                }
            }

            Text {
                // The name should always be shown
                id: nameText

                // bind the nameText's text property to
                // the ContactInfo's name property
                text: myContactInfo.name

                // make this a bigger font
                font {
                    pixelSize: 50
                    weight: Font.Bold
                    capitalization: Font.AllUppercase
                }
            }

            // Make a Button from a Rectangle and
            // a TapHandler
            Rectangle {
                id: detailsButton

                // This button will be checkable so it
                // needs a checked boolean property
                property bool checked: false
                property bool checkable: true

                // it shall also have a signal clicked()
                // which can be emitted
                signal clicked

                anchors {
                    left: parent.left
                    bottom: parent.bottom
                }

                width: 120
                height: 40

                // you can make a "lozenge" shaped button
                // by using this binding for the radius
                radius: height / 2

                // The color and border color can be modified
                // when checked or while being pressed
                color: detailsButton.checked || tapHandler.pressed ? "white" : "black"
                border.color: detailsButton.checked || tapHandler.pressed ? "black" : "white"

                Text {
                    id: buttonText

                    // this button needs some text in its
                    // center which changes color according
                    // to the checked or pressed state.

                    anchors.centerIn: parent

                    text: qsTr("Details")
                    font.weight: Font.Bold

                    // not that the checked property is
                    // correctly qualified within this TextItem
                    color: detailsButton.checked || tapHandler.pressed ? "black" : "white"
                }

                TapHandler {
                    id: tapHandler

                    // there is no need to specify the size
                    // of a TapHandler as it acts upon the
                    // parent (Rectange) automatically.

                    onTapped: {
                        // toggle the checked property of
                        // the button
                        if(detailsButton.checkable) {
                            detailsButton.checked = !detailsButton.checked
                        }

                        // emit the button's clicked signal
                        // in case someone handles it
                        detailsButton.clicked()
                    }
                }
            }

            Item {
                id: basicInfo

                // everything in this Item will only be shown
                // when the detailsButton is NOT checked
                visible: !detailsButton.checked

                anchors {
                    // below the nameText
                    top: nameText.bottom
                    topMargin: 10
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }

                // Now we add a Text for the occupation
                // and company ContactInfo properties,
                // anchoring the companyText's top to the
                // bottom of the occupationText above.

                Text {
                    id: occupationText

                    text: myContactInfo.occupation
                    font.pixelSize: 30
                }
                Text {
                    id: companyText

                    text: myContactInfo.company
                    font.pixelSize: 30

                    // anchor this Text to the one above
                    // with a margin for spacing
                    anchors {
                        top: occupationText.bottom
                        topMargin: 10
                    }
                }
            }

            Item {
                id: detailInfo

                // everything in this Item will only be shown
                // when the detailsButton IS checked
                visible: detailsButton.checked

                anchors {
                    // below the nameText
                    // (same as the basicInfo)
                    top: nameText.bottom
                    topMargin: 10
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }

                // Now we add the remaining ContactInfo
                // properties, anchoring each Text's top
                // to the bottom of Text above

                Text {
                    id: addressText

                    text: myContactInfo.address
                    font.pixelSize: 30
                }
                Text {
                    id: countryText

                    text: myContactInfo.country
                    font.pixelSize: 30
                    anchors {
                        top: addressText.bottom
                        topMargin: 10
                    }
                }
                Text {
                    id: phoneText

                    text: myContactInfo.phone
                    font.pixelSize: 20
                    anchors {
                        top: countryText.bottom
                        topMargin: 10
                    }
                }
                Text {
                    id: emailText

                    text: myContactInfo.email
                    font.pixelSize: 20
                    anchors {
                        top: phoneText.bottom
                        topMargin: 10
                    }
                }
                Text {
                    id: webSiteText

                    text: myContactInfo.webSite
                    font.pixelSize: 20
                    anchors {
                        top: emailText.bottom
                        topMargin: 10
                    }
                }
            }
        }
    }
}
