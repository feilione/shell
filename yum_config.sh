#!/usr/bin/env bash
#encoding:utf-8
#author:feilione
#email:854612337@qq.com
#date:2019/10
os_version=`cat /etc/redhat-release |awk '{print $4}' |awk -F"." '{print $1}'`
[ -d /etc/yum.repos.d ] && mkdir /etc/yum.repos.d/yum.bak
mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/yum.bak &>/dev/null
case "$os_version" in
7)
	curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
	curl -o /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
	yum clean all && yum makecache
	;;
6)
	curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo
	curl -o /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-6.repo
	yum clean all && yum makecache
	;;
*)
	echo "[error]:No corresponding version was found"
esac
systemctl stop firewalld && systemctl disable firewalld
sed -ri '/^SELINUX=/cSELINUX=disabled' /etc/selinux/config
setenforce 0
echo "finish..."



