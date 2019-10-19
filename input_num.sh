#!/usr/bin/env bash
#encoding:utf-8
#author:feilione
#email:854612337@qq.com
#date:2019/10/19

read -p "请输入一个数值: " num
while :
do
	if [[  $num =~ ^[0-9]+$ ]];then
	     break
        else 
              read -p "你输入的不是数字,请重新输入: " num
	fi
done

read -p "Please input prefix: " prefix
while :
do
        if [ -z $prefix ];then
             read -p "Please input prefix: " prefix
        else
             break
        fi
done       
