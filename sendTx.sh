#!/bin/bash
pem=$(cat pem.txt)

addrArray=($(awk '{print $1}' txAddress.txt))  
pKeyArray=($(awk '{print $2}' txAddress.txt)) 
ipArray=($(awk '{print $1}' ip.txt)) 
index=16
for i in {0..3}
do 
  echo ${index} ${ipArray[$index]} ${addrArray[$i]} ${pKeyArray[$i]}
  
  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ipArray[$index]} "git clone https://github.com/wanchain/scanPos"
  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ipArray[$index]} "cd scanPos && git checkout tps && git pull && npm install"
  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ipArray[$index]} "nohup ~/tx.sh ${addrArray[$i]} ${pKeyArray[$i]} >~/tx.log 2>&1 &"
  ((index++))
done