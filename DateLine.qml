import QtQuick 2.12

Text {
	id: root
	text: "12:13"
	font.pixelSize: 32
	font.weight: Font.Medium
	color: "white"

	Timer {
		interval: 1000
		repeat: true
		running: true

		onTriggered: {
                    var date = new Date;

                    var year = date.getFullYear();
                    var month = date.getMonth();
                    var day = date.getDate();
                    var dayOfWeek = date.getDay();

                    var dayOfWeekName = "Okänd dag"

                    switch(dayOfWeek)
                    {
                    case 0:
                        dayOfWeekName = "Söndag";
                        break;
                    case 1:
                        dayOfWeekName = "Måndag";
                        break;
                    case 2:
                        dayOfWeekName = "Tisdag";
                        break;
                    case 3:
                        dayOfWeekName = "Onsdag";
                        break;
                    case 4:
                        dayOfWeekName = "Torsdag";
                        break;
                    case 5:
                        dayOfWeekName = "Fredag";
                        break;
                    case 6:
                        dayOfWeekName = "Lördag";
                        break;
                    }

                    root.text = dayOfWeekName + " " + year + "-" + ("00" + (month+1)).slice(-2) + "-" + ("00" + day).slice(-2);
		}
	}
}
