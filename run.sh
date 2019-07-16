#!/bin/bash
echo $1
echo "wanglu">~/pw.txt
nohup ~/gwan --internal --mine --etherbase $1 --unlock $1 --password ~/pw.txt --datadir ~/data --verbosity 5
echo "start finish"
curl ifconfig.me 
echo ''
echo ''
