#!/bin/bash
num=$(ps aux|grep demo.launch |grep -v grep|wc -l)

if [ $num -gt 0 ] 
then 
   echo "demo.launch has been launched!"
else
   /home/eaibot/dashgo_ws/src/dashgo/dashgo_tools/startup/mini-start-fg.sh>/dev/null 2>&1 &
   echo "demo.launch is starting"
fi
