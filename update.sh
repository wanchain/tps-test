#!/bin/bash
pem=~/tps.pem

cd go-wanchain && git checkout posperf && git pull && make && cp build/bin/gwan ~/

for ip in $(cat ip.txt)
do 
    scp -o StrictHostKeyChecking=no -i ${pem} ~/gwan ubuntu@${ip}:~/gwan
done
