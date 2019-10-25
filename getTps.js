function getTps() {
    var number = eth.blockNumber;
    console.log(pos.getTps(number - 50, number));
}

setInterval(getTps, 15000);
