//18143->18194
function getLeaders(startEpoch, endEpoch) {
    var totalLeaders = [];
    for(var i=startEpoch; i<=endEpoch; i++) {
        var leaders = pos.getLeaderGroupByEpochID(i);
        for(var m=0; m<leaders.length; m++) {
            var line = {
                epochID: i,
                address: leaders[m].secAddr,
                type: leaders[m].type
            };
            totalLeaders.push(line);
        }
    }

    console.log(JSON.stringify(totalLeaders));
}

getLeaders(18143,18194);
