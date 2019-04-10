using Toybox.System as Sys;
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
using Toybox.ActivityMonitor as Act;

module DoNotDisturb {

    function drawIcon(dc, x, y, font) {
        dc.setColor(Utils.getColorMode(), Gfx.COLOR_TRANSPARENT);
        dc.drawText(x, y, font, Utils.moon, Gfx.TEXT_JUSTIFY_CENTER);
    }

    function isDND() {
        if (Sys.getDeviceSettings() has :doNotDisturb) {
            return Sys.getDeviceSettings().doNotDisturb;
        } else {
            return null;
        }
    }

}