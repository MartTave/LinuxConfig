import QtQuick
import Quickshell

import "../services" as QsServices
import "./Base.qml"

Base {
    id: root
    readonly property var sm: QsServices.SystemMonitor

    Row {
        spacing: 3
        Text {
            width: root.iconSize
            color: root.fontColor
            font.pixelSize: root.iconSize
            text: "󰍛"
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -2
        }

        Text {
            color: root.fontColor
            font.family: root.fontFamily
            font.pixelSize: root.fontSize
            text: {
                return Math.round(root.sm.memory).toString().padStart(3, " ") + "%";
            }
        }
    }
}
