#!/bin/sh

if [ "$(ls -la /var/lib/mysql | awk 'NR==1 {print $2}')" -eq 12 ]; then
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
fi

sudo service mariadb start
sudo mariadb -u root -p"${MYSQL_ROOT_PASSWORD}";
