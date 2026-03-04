pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Widgets

Singleton {
    id: root

    readonly property var screen: QtObject {
        property int max
        property int current
        property real percent: {
            if (current === undefined || max === undefined || current === NaN || max === NaN) {
                return 0;
            } else {
                return current / max;
            }
        }
    }

    function setBrightness(value) {
        // Clamp between 0 and 1
        const newValue = Math.max(0, Math.min(1, value));

        // Use brightnessctl for AMD
        const cmd = "brightnessctl set " + Math.round(newValue * 100) + "%";
        setBrightnessProcess.command = ["/bin/sh", "-c", cmd];
        setBrightnessProcess.running = true;

        // Read brightness will be triggered by the update timer
    }

    function increaseBrightness() {
        setBrightness(screen.percent + 0.01);
    }

    function decreaseBrightness() {
        setBrightness(screen.percent - 0.01);
    }

    // get the maximum brightness value
    Process {
        running: true
        command: ["brightnessctl", "max"]
        stdout: StdioCollector {
            onStreamFinished: {
                root.screen.max = parseInt(text);
            }
        }
    }

    // get the current brightness value
    Process {
        id: getCurrentBrightness
        running: true
        command: ["brightnessctl", "get"]
        stdout: StdioCollector {
            onStreamFinished: {
                var val = parseInt(text);
                if (val === undefined) {
                    val = 0;
                }
                root.screen.current = val;
            }
        }
    }

    // listen for backlight events and update the current brightness on UDEV event
    Process {
        running: true
        command: ["udevadm", "monitor", "--subsystem-match=backlight"]
        stdout: SplitParser {
            splitMarker: "UDEV"
            onRead: {
                getCurrentBrightness.running = true;
            }
        }
    }

        // Set brightness process
    Process {
        id: setBrightnessProcess
        running: false
    }
    
}
