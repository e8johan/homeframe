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
import "settings.js" as Settings

Text {
	id: root
	text: "Lördag 19 November 1983"
	font.pixelSize: Settings.headlineFontPixelSize
	font.weight: Settings.headlineFontWeight
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

                    var monthName = "Okänd månad"
                    switch(month)
                    {
                        case 0:
                            monthName= "Januari"
                            break;
                        case 1:
                            monthName= "Febuari"
                            break;
                        case 2:
                            monthName= "Mars"
                            break;
                        case 3:
                            monthName= "April"
                            break;
                        case 4:
                            monthName= "Maj"
                            break;
                        case 5:
                            monthName= "Juni"
                            break;
                        case 6:
                            monthName= "Juli"
                            break;
                        case 7:
                            monthName= "Augusti"
                            break;
                        case 8:
                            monthName= "September"
                            break;
                        case 9:
                            monthName= "Oktober"
                            break;
                        case 10:
                            monthName= "November"
                            break;
                        case 11:
                            monthName= "December"
                            break;
                    }

                    root.text = dayOfWeekName + " " + ("00" + day).slice(-2) + " " + monthName + " " + year;
		}
	}
}
