import Quickshell
import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Layouts

import qs.Theme

Item {
    id: root

    implicitHeight: Global.barHeight
    implicitWidth: sound.implicitWidth
    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }
    Connections {
        target: Pipewire.defaultAudioSink
    }

    readonly property int moduleSize: 15
    readonly property color moduleColor: Colors.flamingo
    readonly property string moduleIcon: Pipewire.defaultAudioSink?.audio.muted ? "" : ""

    RowLayout {
        id: sound
        anchors.centerIn: parent
        spacing: 3

        Text {
            text: {
                if (Pipewire.defaultAudioSink?.audio.muted) {
                    return "";
                } else if (Pipewire.defaultAudioSink?.audio.volume > 0.8) {
                    return "";
                } else {
                    return "";
                }
            }
            color: root.moduleColor
            font.family: Global.font
            font.pixelSize: root.moduleSize
        }
        Text {
            color: root.moduleColor
            font.family: Global.font
            font.pixelSize: root.moduleSize
            text: Math.round(Pipewire.defaultAudioSink?.audio.volume * 100) + "%"
        }
    }

    MouseArea {
        anchors.fill: parent
        enabled: true
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        acceptedButtons: Qt.LeftButton | Qt.MiddleButton
        onClicked: mouse => {
            if (mouse.button == Qt.MiddleButton) {
                Pipewire.defaultAudioSink.audio.muted = !Pipewire.defaultAudioSink.audio.muted;
            } else {} //TODO: Left-click will open a widget
        }
        onWheel: wheel => {
            if (wheel.angleDelta.y > 0) {
                Pipewire.defaultAudioSink.audio.volume += 0.01;
            } else if (wheel.angleDelta.y < 0) {
                Pipewire.defaultAudioSink.audio.volume -= 0.01;
            }
        }
    }
}
