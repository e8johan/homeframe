import QtQuick 2.12
import com.koderize.yr 0.1
import "settings.js" as Settings

TapSlider {
    id: root

    drawerWidth: 128*3 + 16*4

    property int refreshHour: 1
    property string location: "lat=60.10&lon=9.58&altitude=66"

    property var now: {}
    property var next: []

    YrRequest {
        id: yrRequest

        onResponseChanged: {
            const weather = JSON.parse(yrRequest.response);
            var samples = [];

            // Capture the current sample
            samples.push(weather.properties.timeseries[0]);

            // Capture all mid-day samples and mid-night samples
            weather.properties.timeseries.forEach((element) => {
                const d = new Date(Date.parse(element.time));

                if (d.getHours() == 12 || d.getHours() == 0)
                    samples.push(element);
            });

            // If the first sample repeats, then remove it
            if (samples[0] === samples[1])
                samples.remove(0);

            for (var i=0; i<samples.length; ++i) {
                const element = samples[i];

                var res = {}

                const d = new Date(Date.parse(element.time));
                res['dayOfWeek'] = d.getDay();
                res['timeOfDay'] = d.getHours();
                res['temperature'] = element.data.instant.details.air_temperature;
                res['icon'] = element.data.next_6_hours.summary.symbol_code;

                if (i == 0)
                    now = res;
                else
                    next[i-1] = res;
            }
        }
    }

    Image {
        id: icon

        anchors.left: root
        anchors.leftMargin: (settings.drawerHeight-icon.width)/2
        anchors.verticalCenter: root.verticalCenter

        source: 'assets/yr/weather/' + root.now.icon + '.svg'
        width: Settings.iconPixelSize
        height: Settings.iconPixelSize
    }

    Text {
        anchors.verticalCenter: root.verticalCenter
        anchors.left: icon.right
        anchors.leftMargin: 4

        text: root.now.temperature + "°C"
        color: "white"
    }

    function _reload() {
        var url = "https://api.met.no/weatherapi/locationforecast/2.0/compact?" + location;
        yrRequest.get(url)
    }

    Timer {
        interval: 3600000 * root.refreshHour
        running: true
        repeat: true
        onTriggered: _reload();
    }

    // TODO use this somehow
    Timer {
        id: errorRetryTimer

        interval: 300000
        repeat: false
        onTriggered: _reload();
    }

    Component.onCompleted: _reload();
}
