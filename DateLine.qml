/*
 * HomeFrame - an interactive frame for home use
 *
 * Copyright(C) 2023 Johan Thelin <e8johan@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 */

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
