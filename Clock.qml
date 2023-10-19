import QtQuick 2.12

Text {
	id: root
	text: "12:13"
	font.pixelSize: 128
	font.weight: Font.Thin
	color: "white"

	Timer {
		interval: 1000
		repeat: true
		running: true

		onTriggered: {
                    var date = new Date;

                    var hours = date.getHours();
                    var minutes = date.getMinutes();
                    var seconds = date.getSeconds();

                    root.text = ("00" + hours).slice(-2) + ":" + ("00" + minutes).slice(-2) // + ":" + ("00" + seconds).slice(-2);
		}
	}
}
