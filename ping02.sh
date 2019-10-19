#!/usr/bin/env bash
#encoding:utf-8
#author:feilione
#date:2019/10/19

ping -c1 $1 &>/dev/null
if [ $? -eq 0 ];then
        echo "$1 is up."
else
        echo "$1 is down."
fi
