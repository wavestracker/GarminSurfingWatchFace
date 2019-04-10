using Toybox.Graphics as Gfx;
using Toybox.ActivityMonitor as Act;

module HeartRate {

    function drawText(dc, x_center, y_start, font) {
        var heart_rate = 0;
        var hrIter = Act.getHeartRateHistory(null, true);
        
        if(hrIter != null){
            var hr = hrIter.next();
            heart_rate = (hr.heartRate != Act.INVALID_HR_SAMPLE && hr.heartRate > 0) ? hr.heartRate : 0;
        }

        // Draw heart icon.
        dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
        dc.drawText(x_center-2, y_start+5, font, Utils.heart, Gfx.TEXT_JUSTIFY_RIGHT);
        // Draw heart rate text.
        dc.setColor(Utils.getColorMode(), Gfx.COLOR_TRANSPARENT);
        dc.drawText(x_center, y_start, Gfx.FONT_TINY, heart_rate.toString(), Gfx.TEXT_JUSTIFY_LEFT);
    }

    function hrON() {
        return Act has :HeartRateIterator;
    }

}