#!/usr/bin/env bash
#批量删除用户
#1、先创建一个要删除的用户列表


for user in `cat /root/userdel.txt`
do
	userdel -r $user
	echo "The user delete success!"
done
