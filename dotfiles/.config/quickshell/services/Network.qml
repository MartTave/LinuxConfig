pragma Singleton
import Quickshell
import Quickshell.Networking
import QtQuick

Singleton {
    id: root

    readonly property var wifi: {
        for (let d of Networking.devices.values) {
            if (d.type === DeviceType.Wifi) {
                return d
            }
        }
        return undefined
    }

    readonly property var ethernet: {
        for (let d of Networking.devices.values) {
            if (d.type === DeviceType.None) {
                return d
            }
        }
        return undefined
    }
}