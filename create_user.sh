#!/usr/bin/env bash

read -p "Please input a username: " user

#if id $user &>/dev/null; then

id $user &>/dev/null
if [ $? -eq 0 ];then
	echo "user $user already exits"
else
	useradd $user
	if [ $? -eq 0 ];then
		echo "$user is created."
	fi
fi 
