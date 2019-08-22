#!/bin/bash
pem=$(cat pem.txt)

cd ~/go-wanchain && git pull &&git checkout tps-test && git pull && make

cd ~/tps-test

for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}
  ((index++))
  scp -o StrictHostKeyChecking=no -i ${pem} ~/go-wanchain/build/bin/gwan ubuntu@${ip}:~/gwan
  scp -o StrictHostKeyChecking=no -i ${pem} ~/tps-test/run.sh ubuntu@${ip}:~/ 
  scp -o StrictHostKeyChecking=no -i ${pem} ~/tps-test/tx.sh ubuntu@${ip}:~/ 
  #scp -o StrictHostKeyChecking=no -i ${pem} ~/tps-test/watch.sh ubuntu@${ip}:~/ 

done


