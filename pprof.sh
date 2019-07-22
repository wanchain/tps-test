#!/bin/bash
pem=$(cat pem.txt)

index=0
for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}
  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "nohup ~/watch.sh >~/watch.log 2>&1 &"
  ((index++))
done
