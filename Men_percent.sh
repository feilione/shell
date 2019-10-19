#!/usr/bin/env bash
#encoding:utf-8
#author:feilione
#email:854612337@qq.com
#date:@time

Mem_used=`free -m | grep '^M' | awk '{print $3}'`
Mem_total=`free -m | grep '^M' | awk '{print $2}'`
Mem_percent=$((Mem_used*100/Mem_total))
#echo "当前内存使用百分比: $Mem_percent"
war_file=/root/Mem_war.txt
rm -rf $war_file
if [ $Mem_percent -ge 80 ];then
	echo "`date +%F-%H` memory:${Mem_percent}%" > $war_file
fi

if [ -f $war_file ];then
	mail -s "men war..." root < $war_file
	rm -rf $war_file
fi
