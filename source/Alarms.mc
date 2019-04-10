using Toybox.System as Sys;
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;

module Alarms {

    function drawIcon(dc, x, y, font) {
        dc.setColor(Utils.getColorMode(), Gfx.COLOR_TRANSPARENT);
        dc.drawText(x, y, font, Utils.bell, Gfx.TEXT_JUSTIFY_CENTER);
    }

    function areAlarms() {
        return Sys.getDeviceSettings().alarmCount > 0;
    }

}