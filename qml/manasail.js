.pragma library

// Easily tweak the values up here
var gameFormats = {
    "limited": {
        'minLandCount': 0,
        'maxLandCount': 20,
        'dflLandCount': 17
    },
    "constructed": {
        'minLandCount': 0,
        'maxLandCount': 30,
        'dflLandCount': 24
    }
}

// Actually runs the deal
var ManaSail = (function(formats, data) {
    data.formats = formats;
    data.format = {
        'minLandCount': null,
        'maxLandCount': null,
        'dflLandCount': null
    }
    data.counts = {
        'land': 0,
        'white': 0,
        'red': 0,
        'green': 0,
        'blue': 0,
        'black': 0
    }

    function setGameFormat(gameFormat) {
        data.format = data.formats[gameFormat];
        if (data.format == null) {
            console.error("Unknown game type", gameFormat);
            return;
        }
    }
    function getGameFormat() {
        return data.format;
    }

    function setCount(key, count) {
        data.counts[key] = count;
    }
    function getCounts() {
        return data.counts;
    }

    // TODO: Do something
    function calculate() {
    }

    // TODO: Display mana base, not counts
    function display(label) {
        var s = '';
        var key = null;
        var val = null;
        for (key in data.counts) {
            if (key != 'land') {
                val = data.counts[key];
                s += key + ': ' + val + '\n';
            }
        }

        label.text = s;
    }

    return {
        'setGameFormat': setGameFormat,
        'getGameFormat': getGameFormat,
        'setCount': setCount,
        'getCounts': getCounts,
        'calculate': calculate,
        'display': display,
    }
}(gameFormats, {})); // Cannot assign to global scope so pass an array

