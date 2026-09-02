import Quickshell.Widgets
import Quickshell.Services.UPower
import QtQuick
import QtQuick.Layouts

import qs.Theme

Item {
    id: root
    implicitHeight: Global.barHeight
    implicitWidth: module.implicitWidth
    Layout.fillWidth: true

    readonly property real batteryValue: UPower.displayDevice.isPresent ? UPower.displayDevice.percentage : 0
    readonly property bool isCharging: UPower.displayDevice.state == UPowerDeviceState.Charging
    readonly property real lowBatteryThreshold: 0.20
    readonly property color moduleColor: {
        if (isCharging) {
            return Qt.alpha(Colors.green, 0.8);
        } else if (batteryValue <= lowBatteryThreshold) {
            return Qt.alpha(Colors.red, 0.7);
        }
        return Qt.alpha(Colors.lavender, 0.9);
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
    }
    RowLayout {
        id: module
        anchors.centerIn: parent
        spacing: 1
        ClippingWrapperRectangle {
            id: batteryIcon

            color: root.batteryValue > root.lowBatteryThreshold ? Colors.overlay_1 : Colors.overlay_0
            layer {}
            radius: implicitHeight / 4
            implicitHeight: 16
            implicitWidth: implicitHeight * 1.62

            contentInsideBorder: true
            children: Rectangle {
                anchors.fill: parent
                color: "transparent"
                Rectangle {
                    id: batteryFill
                    color: root.moduleColor

                    implicitHeight: parent.implicitHeight
                    implicitWidth: root.batteryValue > 0.10 ? (parent.width * root.batteryValue) : parent.width / 10
                    radius: parent.radius - 2
                    anchors {
                        top: parent.top
                        bottom: parent.bottom
                        left: parent.left
                    }
                }
                Text {
                    anchors.centerIn: parent
                    text: Math.round(root.batteryValue * 100)
                    font {
                        family: Global.font
                        pixelSize: 12
                        weight: Font.Bold
                    }
                    color: root.batteryValue > root.lowBatteryThreshold ? Colors.base : Colors.text
                }
            }
        }
        Rectangle {
            id: batTip

            implicitWidth: 2.3
            implicitHeight: 8
            topRightRadius: 2
            bottomRightRadius: 2
            color: root.moduleColor
        }
    }
}
