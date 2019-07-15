#!/bin/bash
pem=~/tps.pem

for ip in $(cat ip.txt)
do 
    ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "pkill -9 gwan && ps -ef|grep gwan"
done