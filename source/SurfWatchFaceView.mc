using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

class SurfWatchFaceView extends Ui.WatchFace {

    hidden var center_x;
    hidden var center_y;
    hidden var previous_heart_rate = 0;
    hidden var numbers_font;
    hidden var icons_font;

    function initialize() {
        WatchFace.initialize();
    }

    function onExitSleep() {
        // Ui.requestUpdate();
    }

    function onEnterSleep() {
        Ui.requestUpdate();
    }

    // Load your resources here.
    function onLayout(dc) {
        // Center spot.
        center_x = dc.getWidth() / 2;
        center_y = dc.getHeight() / 2;
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
        numbers_font = Ui.loadResource(Rez.Fonts.numbers_font);
        icons_font = Ui.loadResource(Rez.Fonts.icons_font);
    }

    function onPartialUpdate(dc) {
        // Function called once a second even in low-power mode.
        var heartRate = HeartRate.getValue();
        if (heartRate != previous_heart_rate){
            dc.setClip()
            HeartRate.drawText(dc, center_x, 3, heartRate);
            previous_heart_rate = heartRate;
        }
    }

    // Update the view.
    function onUpdate(dc) {
        // reset screen.
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.clear();

        Time.drawText(dc, center_x, center_y, numbers_font);

        // Draw heart rate.
        if (HeartRate.hrON()) {
             HeartRate.draw(dc, center_x, 3, icons_font);
        }

        Calories.drawText(dc, center_x-25, 206, icons_font);
        Battery.drawIcon(dc, center_x, dc.getHeight());

        // Alarms ON.
        var add_padding_to_date = false;
        if (Alarms.areAlarms()) {
            Alarms.drawIcon(dc, center_x + 58, 15, icons_font);
            add_padding_to_date = true;
        }
        // is DND ON.
        if (DoNotDisturb.isDND()) {
            DoNotDisturb.drawIcon(dc, center_x-42, 15, icons_font);
            add_padding_to_date = true;
        }
        Date.drawText(dc, center_x, add_padding_to_date ? 50 : 45);

        // TODO: Battery.
        // TODO: Alarms.
        // TODO: Notifications.
        // TODO: Wind.
        // TODO: swell.
        // TODO: Phone connected.
        // if (PhoneConnected.isConnected()) {
        //     PhoneConnected.drawIcon(dc, center_x-2, 75, Gfx.COLOR_BLUE);
        // }
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
        numbers_font = null;
        icons_font = null;
    }

}


class PartialDelegate extends Ui.WatchFaceDelegate
{

    function initialize() {
        WatchFaceDelegate.initialize();
    }

    function onPowerBudgetExceeded(powerInfo) {
        Sys.println("Average execution time: " + powerInfo.executionTimeAverage);
        Sys.println("Allowed execution time: " + powerInfo.executionTimeLimit);
    }
}
