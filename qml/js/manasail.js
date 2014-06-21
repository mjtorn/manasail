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
    },
    "constructed_large": {
        'minLandCount': 0,
        'maxLandCount': 40,
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

    data.manaBase = {
        'white': 0,
        'red': 0,
        'green': 0,
        'blue': 0,
        'black': 0
    }

    function resetStates() {
        data.counts = {
            'land': 0,
            'white': 0,
            'red': 0,
            'green': 0,
            'blue': 0,
            'black': 0
        }
        data.manaBase = {
            'white': 0,
            'red': 0,
            'green': 0,
            'blue': 0,
            'black': 0
        }
    }

    function setGameFormat(gameFormat) {
        data.format = data.formats[gameFormat];
        if (data.format == null) {
            console.error("Unknown game type", gameFormat);
            return;
        }
        data.counts['land'] = data.format['dflLandCount'];
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

    function calculate() {
        var symbolCount = 0;
        var key = null;
        for (key in data.counts) {
            if (key != 'land') {
                symbolCount += data.counts[key];
            }
        }
        for (key in data.manaBase) {
            if (symbolCount > 0) {
                data.manaBase[key] = data.counts[key] * data.counts['land'] / symbolCount;
            } else {
                data.manaBase[key] = 0;
            }
        }
    }

    function display(label) {
        var s = '';
        var dispKey = null;
        var key = null;
        var val = null;
        for (key in data.manaBase) {
            val = data.manaBase[key];
            dispKey = key[0].toUpperCase() + key.slice(1, key.length);
            s += dispKey + ': ' + Math.round(val) + ' (' + val.toFixed(2) + ')' + '\n';
        }

        label.text = s.slice(0, s.length-1);
    }

    function coverText() {
        var s = 'ManaSail\n\n';
        var dispKey = null;
        var key = null;
        var val = null;
        for (key in data.manaBase) {
            val = data.manaBase[key];
            if (key == 'blue') {
                dispKey = 'U';
            } else {
                dispKey = key[0].toUpperCase();
            }

            s += dispKey + ': ' + Math.round(val) + '\n';
        }

        return s;
    }

    return {
        'resetStates': resetStates,
        'setGameFormat': setGameFormat,
        'getGameFormat': getGameFormat,
        'setCount': setCount,
        'getCounts': getCounts,
        'calculate': calculate,
        'display': display,
        'coverText': coverText,
    }
}(gameFormats, {})); // Cannot assign to global scope so pass an array

