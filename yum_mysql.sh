#!/usr/bin/env bash
#email:lvedafei@163.com
#encoding:utf-8
#author:lvedafei
#date:2019/10


#下载yum仓库
wget https://dev.mysql.com/get/mysql80-community-release-el7-1.noarch.rpm
yum localinstall -y mysql80-community-release-el7-1.noarch.rpm
yum clean all && yum makecache
yum -y install yum-utils
yum-config-manager --disable mysql80-community
yum-config-manager --enable mysql57-community
yum install -y mysql-community-server
systemctl start mysqld.service
systemctl enable mysqld.service








