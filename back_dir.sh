#!/usr/bin/env bash
back_dir=/root/mysql_back
#if ! test -d $back_dir;then
if [ ! -d $back_dir ];then
	mkdir -p $back_dir
fi
echo "开始备份..."
