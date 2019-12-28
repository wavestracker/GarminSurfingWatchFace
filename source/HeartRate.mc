using Toybox.Graphics as Gfx;
using Toybox.ActivityMonitor as Act;
using Toybox.Activity;

module HeartRate {

    function draw(dc, x_center, y_start, font) {
        // Draw heart icon.
        dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
        dc.drawText(x_center-2, y_start+5, font, Utils.heart, Gfx.TEXT_JUSTIFY_RIGHT);
        // Draw heart rate text.
        // drawText(dc, x_center, y_start, getValue());
        drawText(dc, x_center, y_start, 122);
    }

    function drawText(dc, x_center, y_start, value) {
        dc.setColor(Utils.getColorMode(), Gfx.COLOR_TRANSPARENT);
        dc.drawText(x_center, y_start, Gfx.FONT_TINY, value, Gfx.TEXT_JUSTIFY_LEFT);
    }

    function getValue() {
        var value = Activity.getActivityInfo().currentHeartRate;
        if (value != null) {
            return value;
        }
        var hrIter = Act.getHeartRateHistory(null, true);
        var hr = hrIter.next();
        return (hr.heartRate != Act.INVALID_HR_SAMPLE && hr.heartRate > 0) ? hr.heartRate : 0;
    }

    function hrON() {
        return Act has :HeartRateIterator;
    }

}