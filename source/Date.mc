using Toybox.Graphics as Gfx;
using Toybox.Time.Gregorian as Gre;
using Toybox.Time;
using Toybox.Lang as Lang;

module Date {

    function drawText(dc, x, y) {
        var moment = Time.now();
        var date = Gre.info(moment, Time.FORMAT_LONG);
        var dateStr = Lang.format("$1$ $2$, $3$", [
            date.day, date.month, date.day_of_week]);

        dc.setColor(Utils.getColorMode(), Gfx.COLOR_TRANSPARENT);
        dc.drawText(x, y, Gfx.FONT_TINY, dateStr, Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_CENTER);
    }

}