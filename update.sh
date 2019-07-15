#!/bin/bash
pem=$(cat pem.txt)

#cd ~/go-wanchain && git checkout posperf && git pull && make

cd ~/tpsTest

for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}
  ((index++))
  #scp -o StrictHostKeyChecking=no -i ${pem} ~/go-wanchain/build/bin/gwan ubuntu@${ip}:~/
  #scp -o StrictHostKeyChecking=no -i ${pem} ~/tpsTest/run.sh ubuntu@${ip}:~/ 
  scp -o StrictHostKeyChecking=no -i ${pem} ~/tpsTest/tx.sh ubuntu@${ip}:~/ 

done


