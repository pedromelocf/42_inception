#!/bin/sh

if [ "$(ls -la /var/lib/mysql | awk 'NR==1 {print $2}')" -eq 12 ]; then
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
fi

sudo service mariadb start

sudo mariadb -u root -p"${MYSQL_ROOT_PASSWORD}"

sudo mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" -e "
    CREATE DATABASE IF NOT EXISTS wp_db; 
    CREATE ROLE IF NOT EXISTS developer; 
    GRANT ALL PRIVILEGES ON wp_db.* TO developer; 
    CREATE USER IF NOT EXISTS '""${MYSQL_USER}""'@'localhost';
    ALTER USER '""${MYSQL_USER}""'@'localhost' IDENTIFIED BY '""${MYSQL_PASSWORD}""';
    GRANT 'developer' TO '""${MYSQL_USER}""'@'localhost'; 
    FLUSH PRIVILEGES;
    SHOW GRANTS FOR '""${MYSQL_USER}""'@'localhost';
    "

sudo mariadb -u "${MYSQL_USER}" -p"${MYSQL_PASSWORD}" -e "SHOW DATABASES;"

sudo mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" -e "SET ROLE 'developer'; SHOW DATABASES;"