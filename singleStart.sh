#!/bin/bash
pem=$(cat pem.txt)

addrArray=($(awk '{print $1}' address.txt))  

index=0
for ip in $(cat ip.txt)
do 
  if [ $index == $1 ]
  then
  echo ${index} ${ip}
  addr=${addrArray[${index}]}
  echo ${addr}
  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "nohup ~/run.sh ${addr} >~/out.log 2>&1 &"
  fi
  ((index++))
done