import QtQuick 2.12
import "settings.js" as Settings

Item {
    id: root

    property color inactiveColor: "#101d24"
    property color activeColor: "#03a9f4"

    property real drawerWidth: 100

    property int closeTimeout: 3000

    property bool active: false

    height: Settings.drawerHeight
    width: Settings.drawerWidth + root.drawerWidth

    anchors.left: parent.right
    anchors.leftMargin: -Settings.drawerWidth

    Behavior on anchors.leftMargin {
        NumberAnimation { duration: 300; easing.type: Easing.OutQuad; }
    }

    state: "inactive"

    Rectangle {
        id: roundEdge

        anchors.horizontalCenter: background.left
        anchors.verticalCenter: background.verticalCenter

        width: height
        height: background.height
        radius: height/2
        color: background.color
    }

    Rectangle {
        id: background

        anchors.right: root.right
        anchors.verticalCenter: root.verticalCenter

        width: Settings.drawerWidth + root.drawerWidth
        height: Settings.drawerHeight
        color: root.inactiveColor

        Behavior on color {
            ColorAnimation { duration: 300 }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (root.state == "active") {
                    root.state = "inactive";
                    closeTimer.stop();
                } else {
                    root.state = "active";
                    if (root.closeTimeout > 0)
                        closeTimer.start();
                }
            }
        }
    }

    states: [
        State {
            name: "active"
            PropertyChanges { target: background; color: root.activeColor; }
            PropertyChanges { target: root; anchors.leftMargin: -Settings.drawerWidth-root.drawerWidth; }
        },
        State {
            name: "inactive"
            PropertyChanges { target: background; color: root.inactiveColor; }
            PropertyChanges { target: root; anchors.leftMargin: -Settings.drawerWidth; }
        }
    ]

    Timer {
        id: closeTimer

        interval: root.closeTimeout

        onTriggered: { root.state = "inactive"; }
    }
}
