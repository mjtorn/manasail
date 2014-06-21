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

    return {
        'setGameFormat': setGameFormat,
        'getGameFormat': getGameFormat
    }
}(gameFormats, {})); // Cannot assign to global scope so pass an array

