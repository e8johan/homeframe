import QtQuick 2.12
import QtQuick.Window 2.12

Window {
	width: 800
	height: 480
	visible: true
	// visibility: Window.FullScreen
	title: qsTr("HomeFrame")

	HomeFrame {
		anchors.fill: parent
	}
}
