// CenterClock.qml
import QtQuick
import Quickshell

import "./Base.qml"

Base {
    id: root
    width: childrenRect.width
    height: childrenRect.height

    Text {
        id: clock
        color: root.fontColor
        font.pixelSize: root.fontSize
        font.weight: Font.Bold
        font.family: "Agave Nerd"

        function updateTime() {
            const now = new Date()
            text = Qt.formatDateTime(now, "HH:mm")

            // milliseconds until next minute starts
            const msToNextMinute =
                (60 - now.getSeconds()) * 1000 - now.getMilliseconds()

            timer.interval = msToNextMinute
            timer.restart()
        }

        Component.onCompleted: updateTime()

        Timer {
            id: timer
            repeat: false     // dynamically rescheduled
            onTriggered: clock.updateTime()
        }
    }
}

