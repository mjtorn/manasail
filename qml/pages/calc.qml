import QtQuick 2.0
import Sailfish.Silica 1.0

import "../manasail.js" as MSail

Page {
    id: calcPage
    Column {
        id: calcColumn
        width: calcPage.width
        //height: 62
        Label {
            x: Theme.paddingLarge
            text: MSail.ManaSail.getGameFormat()['maxLandCount']
        }
    }
}
