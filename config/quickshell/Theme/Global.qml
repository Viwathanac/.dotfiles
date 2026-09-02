pragma Singleton

import Quickshell
import QtQuick
import "Colors.qml"

Singleton {
    readonly property string font: "JetBrainsMono Nerd Font"

    readonly property int barHeight: 40
    readonly property color barColor: Colors.base
}
