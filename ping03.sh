#!/usr/bin/env bash
#encoding:utf-8
#author:feilione
#email:854612337@qq.com
#date:@time
#如果用户没有加参数

if [ $# -eq 0 ];then
        echo "usage: `basename $0` file"
        exit
fi

if [ ! -f $1 ];then
        echo "error file!"
        exit
fi

for ip in `cat $1`
do
        ping -c1 $ip &>/dev/null
        if [ $? -eq 0 ];then
                echo "$ip is up."
        else
                echo "$ip is down."
        fi
done
