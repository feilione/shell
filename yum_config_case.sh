#!/usr/bin/env bash

yum_sever=139.129.88.60
os_version=`cat /etc/redhat-release |awk '{print $4}' |awk -F"." '{print $1"."$2}'`
[ -d /etc/yum.repos.d ] || mkdir /etc/yum.repos.d/bak
mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/back &>/dev/null

case "$os_version" in
7.3)
	cat >/etc/yum.repo.d/centos7u3.repo <<-EOF
	[centos7u3]
	name=centos7u3
	baseurl=ftp://$yum_server/centos7u3
	gpgcheck=0
	EOF
	echo "7.3 ymu confihure..."
	;;
6.8)
	curl -o /etc/yum.repos.d/cenyos6u8.repo ftp://$yum_server/centos6u8.repo
	;;
5.9)
	curl -o /etc/yum.repos.d/Centos-Base.repo http://mirrors.aliyun.com/repo/Centos-5.repo
	;;
*)
	echo "error"
esac

echo "finish....."
