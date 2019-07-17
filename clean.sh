#!/bin/bash
pem=$(cat pem.txt)

index=0
for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}
  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "rm -rf ~/data/gwan && mkdir -p ~/data/gwan"
  scp -o StrictHostKeyChecking=no -i ${pem} ./static-nodes.json ubuntu@${ip}:~/data/gwan/
  scp -o StrictHostKeyChecking=no -i ${pem} ./nodekeys/n${index} ubuntu@${ip}:~/data/gwan/nodekey
  ((index++))
done
