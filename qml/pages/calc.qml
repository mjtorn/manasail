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
        contentHeight: calcColumn.height
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: summary.top
        anchors.bottomMargin: Theme.paddingLarge
        clip: true

        ScrollDecorator {
            flickable: calcFlickable
        }

        // XXX: The Sliders here need explicit widths, and it would
        // appear subtracting Theme.paddingLarge from it is usable enough
        Column {
            id: calcColumn
            width: calcPage.width
            spacing: Theme.paddingLarge

            PageHeader {
                title: qsTr("Calculate mana base")
            }

            Row {
                id: landRow

                Slider {
                    id: landSlider // :D
                    label: qsTr("Land count")
                    width: calcColumn.width - landPlus5.width - Theme.paddingLarge
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
                }

                Button {
                    id: landPlus5
                    text: "+5"
                    width: Theme.fontSizeSmall * 2
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: Theme.paddingLarge
                    onClicked: {
                        landSlider.maximumValue += 5;
                    }
                }
            }

            Row {
                Separator {
                    width: calcColumn.width
                    height: Theme.paddingLarge * 2
                }
            }

            Row {
                id: whiteRow

                Slider {
                    id: whiteSlider
                    label: qsTr("White count")
                    width: calcColumn.width - landPlus5.width - Theme.paddingLarge
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
                }

                Button {
                    id: whitePlus5
                    text: "+5"
                    width: Theme.fontSizeSmall * 2
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: Theme.paddingLarge
                    onClicked: {
                        whiteSlider.maximumValue += 5;
                    }
                }
            }

            Row {
                id: redRow

                Slider {
                    id: redSlider
                    label: qsTr("Red count")
                    width: calcColumn.width - landPlus5.width - Theme.paddingLarge
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
                }

                Button {
                    id: redPlus5
                    text: "+5"
                    width: Theme.fontSizeSmall * 2
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: Theme.paddingLarge
                    onClicked: {
                        redSlider.maximumValue += 5;
                    }
                }
            }

            Row {
                id: greenRow

                Slider {
                    id: greenSlider
                    label: qsTr("Green count")
                    width: calcColumn.width - landPlus5.width - Theme.paddingLarge
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
                }

                Button {
                    id: greenPlus5
                    text: "+5"
                    width: Theme.fontSizeSmall * 2
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: Theme.paddingLarge
                    onClicked: {
                        greenSlider.maximumValue += 5;
                    }
                }
            }

            Row {
                id: blueRow

                Slider {
                    id: blueSlider
                    label: qsTr("Blue count")
                    width: calcColumn.width - landPlus5.width - Theme.paddingLarge
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
                }

                Button {
                    id: bluePlus5
                    text: "+5"
                    width: Theme.fontSizeSmall * 2
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: Theme.paddingLarge
                    onClicked: {
                        blueSlider.maximumValue += 5;
                    }
                }
            }

            Row {
                id: blackRow

                Slider {
                    id: blackSlider
                    label: qsTr("Black count")
                    width: calcColumn.width - landPlus5.width - Theme.paddingLarge
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
                }

                Button {
                    id: blackPlus5
                    text: "+5"
                    width: Theme.fontSizeSmall * 2
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: Theme.paddingLarge
                    onClicked: {
                        blackSlider.maximumValue += 5;
                    }
                }
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
