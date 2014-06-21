import QtQuick 2.0
import Sailfish.Silica 1.0

import "../manasail.js" as MSail

Page {
    id: calcPage
    onStatusChanged: if (calcPage.status === PageStatus.Inactive) {
                         MSail.ManaSail.resetStates();
                     }

    SilicaFlickable {
        id: calcFlickable
        contentHeight: header.height + landContainer.height + separator.height + whiteContainer.height + redContainer.height + greenContainer.height + blueContainer.height + blackContainer.height
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: summary.top
        anchors.bottomMargin: Theme.paddingLarge
        clip: true

        ScrollDecorator {
            flickable: calcFlickable
        }

        PageHeader {
            id: header
            title: qsTr("Calculate mana base")
        }

        Item {
            id: landContainer
            height: landSlider.height + landPlus5.height
            anchors.top: header.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            Slider {
                id: landSlider // :D
                label: qsTr("Land count")
                stepSize: 1
                minimumValue: MSail.ManaSail.getGameFormat()['minLandCount']
                maximumValue: MSail.ManaSail.getGameFormat()['maxLandCount']
                value: MSail.ManaSail.getGameFormat()['dflLandCount']
                valueText: value
                onReleased: {
                    MSail.ManaSail.setCount('land', value);
                    MSail.ManaSail.calculate();
                    MSail.ManaSail.display(summary);
                }
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: landPlus5.left
                anchors.rightMargin: 0
            }

            Button {
                id: landPlus5
                text: "+5"
                width: Theme.fontSizeSmall * 2
                onClicked: {
                    landSlider.maximumValue += 5;
                }
                anchors.top: parent.top
                anchors.topMargin: landSlider.height / 5
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingLarge * 3
            }
        }

        Separator {
            id: separator
            anchors.top: landContainer.bottom
        }

        Item {
            id: whiteContainer
            height: whiteSlider.height
            anchors.top: separator.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            Slider {
                id: whiteSlider
                label: qsTr("White count")
                width: calcPage.width
                stepSize: 1
                minimumValue: MSail.ManaSail.getGameFormat()['minLandCount']
                maximumValue: MSail.ManaSail.getGameFormat()['maxLandCount']
                value: 0
                valueText: value
                onReleased: {
                    MSail.ManaSail.setCount('white', value);
                    MSail.ManaSail.calculate();
                    MSail.ManaSail.display(summary);
                }
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: whitePlus5.left
                anchors.rightMargin: 0
            }

            Button {
                id: whitePlus5
                text: "+5"
                width: Theme.fontSizeSmall * 2
                onClicked: {
                    whiteSlider.maximumValue += 5;
                }
                anchors.top: parent.top
                anchors.topMargin: whiteSlider.height / 5
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingLarge * 3
            }
        }

        Item {
            id: redContainer
            height: redSlider.height
            anchors.top: whiteContainer.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            Slider {
                id: redSlider
                label: qsTr("Red count")
                width: calcPage.width
                stepSize: 1
                minimumValue: MSail.ManaSail.getGameFormat()['minLandCount']
                maximumValue: MSail.ManaSail.getGameFormat()['maxLandCount']
                value: 0
                valueText: value
                onReleased: {
                    MSail.ManaSail.setCount('red', value);
                    MSail.ManaSail.calculate();
                    MSail.ManaSail.display(summary);
                }
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: redPlus5.left
                anchors.rightMargin: 0
            }

            Button {
                id: redPlus5
                text: "+5"
                width: Theme.fontSizeSmall * 2
                onClicked: {
                    redSlider.maximumValue += 5;
                }
                anchors.top: parent.top
                anchors.topMargin: redSlider.height / 5
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingLarge * 3
            }
        }

        Item {
            id: greenContainer
            height: greenSlider.height
            anchors.top: redContainer.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            Slider {
                id: greenSlider
                label: qsTr("Green count")
                width: calcPage.width
                stepSize: 1
                minimumValue: MSail.ManaSail.getGameFormat()['minLandCount']
                maximumValue: MSail.ManaSail.getGameFormat()['maxLandCount']
                value: 0
                valueText: value
                onReleased: {
                    MSail.ManaSail.setCount('green', value);
                    MSail.ManaSail.calculate();
                    MSail.ManaSail.display(summary);
                }
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: greenPlus5.left
                anchors.rightMargin: 0
            }

            Button {
                id: greenPlus5
                text: "+5"
                width: Theme.fontSizeSmall * 2
                onClicked: {
                    greenSlider.maximumValue += 5;
                }
                anchors.top: parent.top
                anchors.topMargin: greenSlider.height / 5
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingLarge * 3
            }
        }

        Item {
            id: blueContainer
            height: blueSlider.height
            anchors.top: greenContainer.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            Slider {
                id: blueSlider
                label: qsTr("Blue count")
                width: calcPage.width
                stepSize: 1
                minimumValue: MSail.ManaSail.getGameFormat()['minLandCount']
                maximumValue: MSail.ManaSail.getGameFormat()['maxLandCount']
                value: 0
                valueText: value
                onReleased: {
                    MSail.ManaSail.setCount('blue', value);
                    MSail.ManaSail.calculate();
                    MSail.ManaSail.display(summary);
                }
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: bluePlus5.left
                anchors.rightMargin: 0
            }

            Button {
                id: bluePlus5
                text: "+5"
                width: Theme.fontSizeSmall * 2
                onClicked: {
                    blueSlider.maximumValue += 5;
                }
                anchors.top: parent.top
                anchors.topMargin: blueSlider.height / 5
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingLarge * 3
            }
        }

        Item {
            id: blackContainer
            height: blackSlider.height
            anchors.top: blueContainer.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            Slider {
                id: blackSlider
                label: qsTr("Black count")
                width: calcPage.width
                stepSize: 1
                minimumValue: MSail.ManaSail.getGameFormat()['minLandCount']
                maximumValue: MSail.ManaSail.getGameFormat()['maxLandCount']
                value: 0
                valueText: value
                onReleased: {
                    MSail.ManaSail.setCount('black', value);
                    MSail.ManaSail.calculate();
                    MSail.ManaSail.display(summary);
                }
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: blackPlus5.left
                anchors.rightMargin: 0
            }

            Button {
                id: blackPlus5
                text: "+5"
                width: Theme.fontSizeSmall * 2
                onClicked: {
                    blackSlider.maximumValue += 5;
                }
                anchors.top: parent.top
                anchors.topMargin: blackSlider.height / 5
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingLarge * 3
            }
        }
    }
    Label {
        id: summary
        width: calcPage.width
        anchors.left: parent.left
        anchors.leftMargin: Theme.paddingLarge * 2
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Theme.paddingLarge
    }

    Component.onCompleted: MSail.ManaSail.display(summary);
}
