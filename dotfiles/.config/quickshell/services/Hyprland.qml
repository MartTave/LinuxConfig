pragma Singleton


import QtQuick

import Quickshell
import Quickshell.Hyprland

Singleton {
    id: root

    readonly property var hyp: Hyprland

    readonly property var wp: {
        if (root.hyp !== undefined && root.hyp !== null) {
            return root.hyp.workspaces
        }
        return undefined
    }

    readonly property var normalWp: {
        if (root.wp !== undefined) {
            return root.wp.values.filter((a) => {return a.id > 0})
        }
        return undefined
    }



}