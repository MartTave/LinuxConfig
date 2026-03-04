import Quickshell
import QtQuick

import "./Base.qml"
import "../services" as QsServices

Base {
    id: root
    property var icons: ["󰃞", "󰃟", "󰃠"]

    property var brightness: QsServices.Brightness

    MouseArea {
        anchors.fill: parent // Make the clickable area match the Rectangle
        cursorShape: Qt.PointingHandCursor // Changes the mouse cursor to a hand
        
        onClicked: {
            shellRoot.controlBarToggle = !shellRoot.controlBarToggle
        }
        
        onWheel: (wheel) => {
            let y = wheel.angleDelta.y
            if (Math.abs(y) < 10) {
                return
            }
            if (y > 0) {
                root.brightness.increaseBrightness()
            } else {
                root.brightness.decreaseBrightness()
            }
        }
    }

    Row {   
        spacing: 3
        Text {
            width: root.iconSize
            color: root.fontColor
            font.pixelSize: root.iconSize
            text: {
                var val = root.icons[Math.round(root.brightness.screen.percent * 2)]
                if (val === undefined || val === NaN) {
                    return root.icons[1]
                } else {
                    return val
                }
            }
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -2
        }

        Text {
            color: root.fontColor
            font.pixelSize: root.fontSize
            anchors.verticalCenter: parent.verticalCenter
                font.family: root.fontFamily
            text: Math.round(root.brightness.screen.percent * 100).toString().padStart(3, " ") + "%"
        }
    }
}
