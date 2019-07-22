#!/bin/bash
echo 'pprof watch memory start'
mkdir heaps
index=0
while true; do
go tool pprof -alloc_space -cum -svg http://127.0.0.1:6060/debug/pprof/heap > heaps/heap${index}.svg
((index++))
sleep 20
done
