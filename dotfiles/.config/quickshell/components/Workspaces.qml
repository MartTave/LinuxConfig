import QtQuick

import Quickshell


import "../services" as QsServices
import "./Base.qml"

Base {
    id: root

    anchors.verticalCenter: parent.verticalCenter
    readonly property var hyp: QsServices.Hyprland

    readonly property var speWpMapping: {
        "special:bitwarden": "bw"
    }

    Row {
        spacing: 10

        Text {
            font.pixelSize: root.iconSize
            color: root.fontColor
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -1
            text: "󰣇"
        }

        Repeater {
            model: root.hyp.normalWp

            delegate: Loader {

                active: {modelData.id > 0}

                sourceComponent: Text {
                    color: {
                        if (modelData.focused) {
                            "#f38ba8"
                        }
                        else if (modelData.active) {
                            "#89b4fa"
                        } else {
                            QsServices.Constants.fontDisabledColor
                        }
                    }
                    font.pixelSize: root.fontSize
                    font.bold: true
                    text: modelData.name.padStart(2, " ")
                }
            }
        }
    }
}
