function getTps() {
    var number = eth.blockNumber;
    console.log(pos.getTps(number - 100, number));
}

setInterval(getTps, 5000);
