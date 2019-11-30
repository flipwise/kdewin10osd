/*
 * Copyright 2014 Martin Klapetek <mklapetek@kde.org>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0
import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

ColumnLayout {
    property QtObject rootItem
    height:  rootItem.showingProgress ? units.gridUnit * 6 : width
    width: Math.round(units.gridUnit * 1.5)

    PlasmaCore.IconItem {
        id: icon
        Layout.alignment: Qt.AlignHCenter
        source: rootItem.icon
        implicitWidth: units.iconSizes.smallMedium
        implicitHeight: implicitWidth
    }

    PlasmaComponents.ProgressBar {
        id: progressBar
        visible: rootItem.showingProgress
        Layout.alignment: Qt.AlignHCenter
        Layout.fillHeight: true
        orientation: Qt.Vertical
        minimumValue: 0
        maximumValue: 100
        value: Number(rootItem.osdValue)
    }

    PlasmaComponents.Label {
        visible: rootItem.showingProgress
        Layout.alignment: Qt.AlignHCenter
        text: Number(rootItem.osdValue)
        font.pointSize: theme.smallestFont.pointSize
    }
}
