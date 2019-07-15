#!/bin/bash
pem=$(cat pem.txt)

addrArray=($(awk '{print $1}' txAddress.txt))  
pKeyArray=($(awk '{print $2}' txAddress.txt)) 
ipArray=($(awk '{print $1}' ip.txt)) 
index=16
for addrInfo in $(cat txAddress.txt)
do 
  echo ${index} ${ipArray[$index]} ${addrArray[$index]} 
  
  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "git clone https://github.com/wanchain/scanPos && cd scanPos && git checkout tps && git pull && npm install"
  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "nohup ~/tx.sh ${addrArray[$index]} ${pKeyArray[$index]} >~/tx.log 2>&1 &"
  ((index++))
done