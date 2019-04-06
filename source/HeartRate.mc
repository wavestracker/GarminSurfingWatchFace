using Toybox.Graphics as Gfx;
using Toybox.ActivityMonitor as Act;

module HeartRate {

    function drawText(dc, cx, cy) {
        var heart_rate = 666;
        var hrIter = Act.getHeartRateHistory(null, true);

        if(hrIter != null){
            var hr = hrIter.next();
            heart_rate = (hr.heartRate != Act.INVALID_HR_SAMPLE && hr.heartRate > 0) ? hr.heartRate : 0;
        }
        var hStr = heart_rate.toString();

        dc.setColor(Utils.getColorMode(), Gfx.COLOR_TRANSPARENT);
        dc.drawText(cx, cy, Gfx.FONT_XTINY, hStr, Gfx.TEXT_JUSTIFY_LEFT);
    }

    function hrON() {
        return Act has :HeartRateIterator;
    }

}