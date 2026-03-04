pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Services.Pipewire


Singleton {

    id: root
    PwObjectTracker {
        objects: [
            Pipewire.defaultAudioSource,
            Pipewire.defaultAudioSink,
            Pipewire.nodes,
            Pipewire.links
        ]
    }

    property var sinks: Pipewire.nodes.values.filter(node => node.isSink && !node.isStream && node.audio)
    property PwNode defaultSink: Pipewire.defaultAudioSink

    property var sources: Pipewire.nodes.values.filter(node => !node.isSink && !node.isStream && node.audio)
    property PwNode defaultSource: Pipewire.defaultAudioSource

    property real volume: defaultSink?.audio?.volume ?? 0
    property bool muted: defaultSink?.audio?.muted ?? false

    function setVolume(to: real): void {
        if (defaultSink?.ready && defaultSink?.audio) {
            defaultSink.audio.muted = false;
            defaultSink.audio.volume = Math.max(0, Math.min(1, to));
        }
    }

    function relativeSetVolume(step: real): void {
        if (defaultSink?.ready && defaultSink?.audio) {
            let oldVolume = root.volume
            defaultSink.audio.volume = Math.max(0, Math.min(1, oldVolume + step));
        }   
    }

    function setSourceVolume(to: real): void {
        if (defaultSource?.ready && defaultSource?.audio) {
            defaultSource.audio.muted = false;
            defaultSource.audio.volume = Math.max(0, Math.min(1, to));
        }
    }

    function toggleMute() {
        if (defaultSink?.ready && defaultSink.audio) {
            defaultSink.audio.muted = !defaultSink.audio.muted
        }
    }

    function setDefaultSink(sink: PwNode): void {
        Pipewire.preferredDefaultAudioSink = sink;
    }

    function setDefaultSource(source: PwNode): void {
        Pipewire.preferredDefaultAudioSource = source;
    }

    function init() {
    }
}