#!/bin/bash

ProgName="gmapping_demo.launch"
num=$(ps aux|grep ${ProgName} |grep -v grep|wc -l)

if [ $num -gt 0 ] 
then 
   echo "${ProgName}  has been launched!"
else
   /home/eaibot/dashgo_ws/src/dashgo/dashgo_tools/startup/gmapping-start-fg.sh>/dev/null 2>&1 &
   echo "${ProgName} is starting"
fi
