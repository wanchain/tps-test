#!/bin/bash
export NODE_PATH=.
cd ~/scanPos/
nohup node commonTx.js -a $1 -p $2