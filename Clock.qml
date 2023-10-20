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
	text: "12:13"
	font.pixelSize: Settings.clockFontPixelSize
	font.weight: Settings.clockFontWeight
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
