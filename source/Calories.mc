using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
using Toybox.ActivityMonitor as Act;

module Calories {

    function drawText(dc, x, y, font) {
        var info = Act.getInfo();

        // Drawn icon.
        dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
        dc.drawText(x, y, font, Utils.calories, Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_RIGHT);
        // Drawn calories burned text.
        dc.setColor(Utils.getColorMode(), Gfx.COLOR_TRANSPARENT);
        dc.drawText(x, y, Gfx.FONT_XTINY, info.calories, Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_LEFT);
    }

}