using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;

module Status {

    function drawText(dc, cx, cy) {
        var calc = Goals.getCalories() - Goals.getCaloriesGoal();
        var unit = "kCal";
        var bitmap = Ui.loadResource(Rez.Drawables.move);
        var msg = simple(calc);

        dc.drawBitmap(cx-60, 197, bitmap);
        dc.setColor(Utils.getColorMode(), Gfx.COLOR_TRANSPARENT);
        dc.drawText(cx-17, 206, Gfx.FONT_XTINY, msg, Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_LEFT);
    }

    function simple(msg) {
        var pos = msg.toString().find(".");
        if (pos) {
            return msg.toString().substring(0, pos + 2);
        }
        return msg;
    }

}