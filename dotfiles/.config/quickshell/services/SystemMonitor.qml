pragma Singleton


import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property real cpu: 0
    property real memory: 0

    Process {
        id: cpuProcess
        command: ["/bin/sh", "-c", "cat /proc/stat | grep '^cpu '"]
        running: false
        
        stdout: SplitParser {
            id: sp
            property real lastCpuTotal: -1
            property real lastCpuIdle: -1
            onRead: data => {
                const parts = data.trim().split(/\s+/)
                if (parts.length >= 5) {
                    const user = parseInt(parts[1])
                    const nice = parseInt(parts[2])
                    const system = parseInt(parts[3])
                    const idle = parseInt(parts[4])
                    const total = user + nice + system + idle
                
                    let dTotal = total - sp.lastCpuTotal 
                    let dIdle = idle - sp.lastCpuIdle
                    root.cpu = Math.round((1 - (dIdle / dTotal)) * 100 * 100) / 100
                    sp.lastCpuTotal = total
                    sp.lastCpuIdle = idle
                }
            }
        }
    }

    Process {
        id: memoryProcess
        command: ["/bin/sh", "-c", "free -b | grep Mem"]
        running: false
        
        stdout: SplitParser {
            onRead: data => {
                const parts = data.trim().split(/\s+/)
                if (parts.length >= 3) {
                    let memTotal = parseFloat(parts[1])
                    let memUsed = parseFloat(parts[2])
                    root.memory = Math.round(memUsed / (memTotal / 100) * 100) / 100
                }
            }
        }
    }

    Timer {
        interval: 2000
        running: true
        repeat: true

        property bool flipflop: true

        onTriggered: {
            cpuProcess.running = true
            if (flipflop) {
                memoryProcess.running = true
            }
            flipflop = !flipflop
        }
    }

}