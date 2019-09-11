var oldNumber = 0;
function testStableTime() {
    var number = eth.blockNumber;
    if (number != oldNumber) {
        var timeNow = eth.getBlock(number).timestamp;
        var stableNumber = pos.getMaxStableBlkNumber();
        var stableTime = eth.getBlock(stableNumber).timestamp;
        console.log(number, stableNumber, timeNow, stableTime, pos.getSlotID());
        oldNumber = number;
    }
}

setInterval(testStableTime, 1000, null);