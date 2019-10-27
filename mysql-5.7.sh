#!/usr/bin/env bash
#filepath:/root
#email:lvedafei@163.com
#encoding:utf-8
#author:lvedafei
#date:2019/10

#安装环境
yum -y install ncurses ncurses-devel openssl-devel bison gcc gcc-c++ make cmake
wget https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-boost-5.7.28.tar.gz

groupadd mysql
useradd -r -g mysql -s /bin/false mysql
tar xf mysql-boost-5.7.28.tar.gz
cd /root/mysql-5.7.28

#编译
cmake . \
-DWITH_BOOST=boost/ \
-DCMAKE_INSTALL_PREFIX=/usr/local/mysql \
-DSYSCONFDIR=/etc \
-DMYSQL_DATADIR=/usr/local/mysql/data \
-DINSTALL_MANDIR=/usr/share/man \
-DMYSQL_TCP_PORT=3306 \
-DMYSQL_UNIX_ADDR=/tmp/mysql.sock \
-DDEFAULT_CHARSET=utf8 \
-DEXTRA_CHARSETS=all \
-DDEFAULT_COLLATION=utf8_general_ci \
-DWITH_READLINE=1 \
-DWITH_SSL=system \
-DWITH_EMBEDDED_SERVER=1 \
-DENABLED_LOCAL_INFILE=1 \
-DWITH_INNOBASE_STORAGE_ENGINE=1
make && make install

#进行初始化
cd /usr/local/mysql
mkdir mysql-files
chown -R mysql.mysql /usr/local/mysql
touch /root/mimi.txt
echo `/usr/local/mysql/bin/mysqld --initialize --user=mysql --basedir=/usr/local/mysql --datadir=/usr/local/mysql/data` > /root/mimi.txt
/usr/local/mysql/bin/mysql_ssl_rsa_setup --datadir=/usr/local/mysql/data
#修改配置文件
echo "[mysqld]" > /etc/my.cnf
echo "basedir=/usr/local/mysql" >> /etc/my.cnf
echo "datadir=/usr/local/mysql/data" >> /etc/my.cnf
cp support-files/mysql.server /etc/init.d/mysqld
#添加mysql服务
chkconfig --add mysqld
#开机自动启动mysql服务
chkconfig mysqld on
systemctl start mysqld
passwd=`cat /root/mimi.txt |grep 'A temporary password' |awk '{print $NF}'`
#echo "export PATH=$PATH:/usr/local/mysql/bin" >> /etc/profile
#mysqladmin -uroot -p'$passwd' password 'FeiFei@123'
/usr/local/mysql/bin/mysqladmin -uroot -p'$passwd' password 'FeiFei@123'















