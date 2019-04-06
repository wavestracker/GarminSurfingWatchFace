using Toybox.System as Sys;
using Toybox.Graphics as Gfx;
using Toybox.Lang;

module Battery {

    function drawIcon(dc, cx, bottom_y) {
        var battery = Sys.getSystemStats().battery;
        var width=43;
        var height=16;
        var cy = bottom_y-height-1/2;  // -1 because the screen is rounded.
        var xStart= cx-width/2;
        var yStart= cy-height/2;

        dc.setPenWidth(1);
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
        dc.drawRectangle(xStart, yStart, width, height);
        dc.fillRectangle(xStart, yStart, width, height);
        dc.fillRectangle(xStart + width - 1, yStart + 6, 3, height - 12);


        if(battery<=20){
            dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
        } else {
            dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_TRANSPARENT);
        }
 
        dc.drawText(cx, yStart - 3, Gfx.FONT_XTINY, Lang.format("$1$%", [battery.format("%d")]), Gfx.TEXT_JUSTIFY_CENTER);

    }

}