using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Graphics as Gfx;

module Utils {

    // var arrow_down = "d";
    // var arrow_up = "u";

    // var battery_charging = "'";
    // var battery0 = "#";
    // var battery1 = "$";
    // var battery2 = "%";
    // var battery3 = "&";
    var bell = "b";
    // var bluethooth = "z";
    // var bolt = "B";

    var calories = "c";
    // var celcius = "C";
    // var cloudy = 0;

    // var gps = "f";
    // var gps2 = "g";

    var heart = "h";

    var moon = "m";

    // var phone = "p";

    // var rainy = 3;

    // var signal0 = 7;
    // var signal1 = 8;
    // var signal2 = 9;
    // var signal3 = "!";
    // var signal4 = "\"";
    // var star = "S";
    // var sun_cloudy = 1;
    // var sunny = 6;
    // var sunset = "X";
    // var sunrise = "Y";
    // var swell = "i";
    // var swell2 = "W";

    // var temperature = "t";
    // var temperature2 = "T";
    // var thunderstorm = 2;
    // var tide_down = "Z";
    // var tide_up = "a";

    // var windy = 4;

    function getColorMode() {
        if (DoNotDisturb.isDND()) {
            return Gfx.COLOR_LT_GRAY;
        }
        else {
            return Gfx.COLOR_WHITE;
        }
    }

}