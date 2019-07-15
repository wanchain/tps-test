#!/bin/bash
pem=$(cat pem.txt)

for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}
  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "pkill -9 gwan && ps -ef|grep gwan"
  ((index++))
done
