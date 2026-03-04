import QtQuick
import Quickshell

import "./Base.qml"
import "./Constants.qml"
import "../services" as QsServices

Base {
    id: root


    property var audio: QsServices.Audio


    property var icons: [" ", "", ""]
    property var iconMuted: ""

    MouseArea {
        anchors.fill: parent // Make the clickable area match the Rectangle
        cursorShape: Qt.PointingHandCursor // Changes the mouse cursor to a hand
        
        onClicked: {
            root.audio.toggleMute()
        }
        
        onWheel: (wheel) => {
            let y = wheel.angleDelta.y
            if (Math.abs(y) < 10) {
                return
            }
            if (y > 0) {
                root.audio.relativeSetVolume(0.01)
            } else {
                root.audio.relativeSetVolume(-0.01)
            }
        }
    }

    Row {
        spacing: 5
        Text {
            width: root.iconSize
            text: {
                if (root.audio.muted) {
                    return root.iconMuted
                } else {
                    return root.icons[Math.round(root.audio.volume * 2)]
                }
            }
            color: {
                if (root.audio.muted) {
                    return QsServices.Constants.fontDisabledColor
                }
                return root.fontColor
            }
            font.pixelSize: root.iconSize
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 0-1
        }

        Text {
            text: Math.round(root.audio.volume * 100).toString().padStart(3, " ") + "%"
            color: {
                if (root.audio.muted) {
                    return QsServices.Constants.fontDisabledColor
                }
                return root.fontColor
            }
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: root.fontSize
            font.family: root.fontFamily
        }
    }
}