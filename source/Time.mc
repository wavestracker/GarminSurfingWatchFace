using Toybox.System as Sys;
using Toybox.Graphics as Gfx;
using Toybox.Time.Gregorian as Gre;
using Toybox.Time;
using Toybox.Math as Mt;

module Time {

    function drawText(dc, cx, cy, font) {
        var moment = Time.now();
        var date = Gre.info(moment, Time.FORMAT_LONG);
        var hourString = date.hour.format("%02d");
        var minuteString = date.min.format("%02d");

        // TODO: get this from sea level.
        var activePercent = 50;

        var text = hourString + ":" + minuteString;
        drawTimeWithWaterLevel(
            dc, cx, cy, text, activePercent, Gfx.COLOR_BLUE, font);
    }

    function normalizeHeight(value, goal) {
        var r =  (value * goal / 100);
        if (r > goal) {
            r = goal;
        }
        return r;
    }

    function drawTimeWithWaterLevel(dc, x, y, text, value, color, font) {
        x -= 4; // Fix padding
        var text_width = dc.getTextWidthInPixels(text, font);
        var text_height = 90;
        var limit = normalizeHeight(value, text_height);
        var colorBack = Utils.getColorMode();
        var wave_height = 6;
        var wave_width = 4;

        var x_start = x - (text_width/2);
        var x_end = x + (text_width/2);
        var y_start = y - (text_height/2);
        var y_end = y + (text_height/2);
        var water_line = y_end-limit;

        dc.setColor(colorBack, colorBack);
        dc.fillRectangle(x_start, y_start + 1, text_width, text_height);
        dc.setColor(color, color);

        // Fill the watter
        if (water_line - y_start > wave_height) {
            // Only draw wave if there is enough space.
            for (var i=x_start; i<x_end; i += 1) {
                var polygon_x = x_start + i;
                if (polygon_x % (2*wave_width) == 0) {
                    dc.fillPolygon([
                        [polygon_x-(wave_width/2), water_line],
                        [polygon_x, water_line - getRandom(wave_height)],
                        [polygon_x+(wave_width/2), water_line],
                    ]);
                }
            }
        }
        dc.fillRectangle(x_start, water_line, text_width, limit);
        dc.setColor(Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK);
        dc.drawText(x, y, font, text, Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_CENTER);
    }

    function getRandom(max) {
        Mt.srand(Sys.getTimer());
        var r = Mt.rand() % max;
        return r;
    }

}