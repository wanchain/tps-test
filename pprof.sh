#!/bin/bash
set +x
mkdir ~/pprofSVG
circleIndex=0
while true; do
index=0
for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}
  mkdir ~/pprofSVG/${circleIndex}
  go tool pprof -alloc_space -cum -svg http://${ip}:6060/debug/pprof/heap > ~/pprofSVG/${circleIndex}/heap-node-${index}.svg
  ((index++))
done
sleep 30
((circleIndex++))
done


