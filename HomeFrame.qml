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

Rectangle {
	color: "black"

	DateClock {
		anchors.left: parent.left
		anchors.bottom: parent.bottom
		anchors.margins: 16
	}

	YrNow {
		anchors.right: parent.right
		anchors.top: parent.top

		anchors.topMargin: 16
	}
}
