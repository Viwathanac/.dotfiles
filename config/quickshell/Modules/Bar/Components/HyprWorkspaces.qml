pragma ComponentBehavior: Bound

import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

import qs.Theme

RowLayout {
    id: root

    readonly property color moduleColor: Colors.surface_1
    readonly property color urgentColor: Colors.red
    readonly property color activeColor: Colors.mauve

    implicitWidth: module.implicitWidth + 10
    implicitHeight: Global.barHeight
    spacing: 9
    Repeater {
        id: module
        model: 5

        delegate: Rectangle {
            id: workspaceObject
            required property var modelData

            readonly property var workspace: Hyprland.workspaces.values.find(workspace => workspace.id === modelData + 1)
            readonly property bool isActive: Hyprland.focusedWorkspace ? Hyprland.focusedWorkspace.id === (modelData + 1) : false
            readonly property bool isUrgent: workspace ? workspace.urgent : false

            implicitWidth: isActive ? 25 : 13
            implicitHeight: isActive ? 15 : 13
            radius: implicitHeight
            border.color: root.activeColor
            border.width: isActive ? 3 : 0
            color: isActive ? "transparent" : (isUrgent ? root.urgentColor : root.moduleColor)
            MouseArea {
                id: workspaceButton
                anchors.fill: parent
                enabled: true
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: Hyprland.dispatch(`hl.dsp.focus({ workspace = ${parent.modelData + 1} })`)
            }

            Behavior on implicitWidth {
                NumberAnimation {
                    duration: 160
                    easing.type: Easing.Bezier
                }
            }
        }
    }
}
