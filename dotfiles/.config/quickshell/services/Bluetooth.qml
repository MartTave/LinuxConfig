pragma Singleton


import QtQuick
import Quickshell
import Quickshell.Bluetooth

Singleton {
    id: root


    readonly property var ready: {
        return Bluetooth.defaultAdapter !== undefined && Bluetooth.defaultAdapter !== null
    }

    readonly property var connected: {
        if (!root.ready) {
            return false
        }
        return Bluetooth.defaultAdapter.devices.values.reduce((a, v) => a || v.connected, false)
    }

    readonly property var enabled: {
        if (!root.ready) {
            return false
        }
        return Bluetooth.defaultAdapter.enabled
    }
    
}