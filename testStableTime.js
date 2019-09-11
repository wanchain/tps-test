var oldNumber = 0;
function testStableTime() {
    var number = eth.blockNumber;
    if (number != oldNumber) {
        var timeNow = eth.getBlock(number).timestamp;
        var stableNumber = pos.getMaxStableBlkNumber();
        var stableTime = eth.getBlock(stableNumber).timestamp;
        console.log("number:", number, "stableNumber:", stableNumber, "confirmTime:", timeNow - stableTime, "timeStamp:", timeNow, stableTime);
        oldNumber = number;
    }
}

setInterval(testStableTime, 1000, null);