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
        clip: true

        ScrollDecorator {
            flickable: calcFlickable
        }

        Column {
            id: calcColumn
            width: calcPage.width
            spacing: Theme.paddingLarge

            PageHeader {
                title: qsTr("Calculate mana base")
            }

            Slider {
                id: landSlider // :D
                label: qsTr("Land count")
                width: calcPage.width
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
            }

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
            }

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
            }

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
            }

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
            }

        }
    }
    Label {
        id: summary
        width: calcPage.width
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }

    Component.onCompleted: MSail.ManaSail.display(summary);
}
