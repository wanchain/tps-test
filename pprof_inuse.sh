#!/bin/bash
set +x
mkdir ~/pprofSVG_inuse
circleIndex=0
while true; do
index=0
mkdir ~/pprofSVG/${circleIndex}

for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}
  go tool pprof -inuse_space -cum -svg http://${ip}:6060/debug/pprof/heap > ~/pprofSVG_inuse/${circleIndex}/heap-node-${index}.svg
  ((index++))
done
sleep 30
((circleIndex++))
done


