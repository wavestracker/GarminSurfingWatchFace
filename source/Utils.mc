using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Graphics as Gfx;

module Utils {

    var myFont = null;

    function getFont() {
        if (myFont == null) {
            myFont = Ui.loadResource(Rez.Fonts.numbers_font);
        }
        return myFont;
    }

    function getColorMode() {
        if (DoNotDisturb.isDND()) {
            return Gfx.COLOR_DK_GRAY;
        }
        else if (DoNotDisturb.isSleepy()) {
            return Gfx.COLOR_LT_GRAY;
        }
        else {
            return Gfx.COLOR_WHITE;
        }
    }

}