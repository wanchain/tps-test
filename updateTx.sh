#!/bin/bash
pem=$(cat pem.txt)
cd ~/tpsTest

for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}
  ((index++))
  scp -o StrictHostKeyChecking=no -i ${pem} ~/tpsTest/tx.sh ubuntu@${ip}:~/ 
done


