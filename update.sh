#!/bin/bash
pem=$(cat pem.txt)

cd ~/go-wanchain && git pull &&git checkout tps-test && git pull && make release

cd ~/tpsTest

for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}
  ((index++))
  scp -o StrictHostKeyChecking=no -i ${pem} ~/go-wanchain/build/bin/gwan-linux-amd64 ubuntu@${ip}:~/gwan
  scp -o StrictHostKeyChecking=no -i ${pem} ~/tpsTest/run.sh ubuntu@${ip}:~/ 
  scp -o StrictHostKeyChecking=no -i ${pem} ~/tpsTest/tx.sh ubuntu@${ip}:~/ 
  #scp -o StrictHostKeyChecking=no -i ${pem} ~/tpsTest/watch.sh ubuntu@${ip}:~/ 

done


