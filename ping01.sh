#!/usr/bin/env bash
#encoding:utf-8
#author:feilione
#date:2019/10/19

read -p "Please input a ip: " ip
ping -c1 $ip &>/dev/null
if [ $? -eq 0 ];then
        echo "$ip is up."
else
        echo "$ip is down."
fi
