#!/usr/bin/env bash
#encoding:utf-8
#author:feilione
#email:854612337@qq.com
#date:2019/10/19

ip=139.129.88.60
i=1
while [ $i -le 5 ]
do
        ping -c1 $ip &>/dev/null
        if [ $? -eq 0 ];then
              echo "$ip is up...."
        fi
        let i++
done
