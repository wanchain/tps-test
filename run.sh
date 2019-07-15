#!/bin/bash
curl ifconfig.me
echo ""
echo $1

echo "wanglu" > ~/pw.txt
nohup ~/gwan --internal --mine --etherbase $1 --unlock $1 --password ~/pw.txt --datadir ~/data