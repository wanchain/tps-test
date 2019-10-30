#!/bin/bash
pem=$(cat pem.txt)

for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}
  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "sudo iptables --flush"
  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "sudo iptables -A INPUT -m hashlimit --hashlimit-above 10240kb/s --hashlimit-mode srcip --hashlimit-name in -j DROP"
  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "sudo iptables -A OUTPUT -m hashlimit --hashlimit-above 10240kb/s --hashlimit-mode dstip --hashlimit-name out -j DROP"

  ((index++))
done
