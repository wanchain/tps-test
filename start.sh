#!/bin/bash
pem=$(cat pem.txt)

for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}
  ((index++))
  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "nohup ./run.sh ${addr} >~/out.log 2>&1 &"
done
