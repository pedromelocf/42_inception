#!/bin/sh

/etc/init.d/mariadb start

sleep 4;

mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" -e "
    CREATE DATABASE IF NOT EXISTS WordPress; 
    CREATE ROLE IF NOT EXISTS developer; 
    GRANT ALL PRIVILEGES ON WordPress.* TO developer; 
    CREATE USER IF NOT EXISTS '"${MYSQL_USER}"'@'%';
    ALTER USER '"${MYSQL_USER}"'@'%' IDENTIFIED BY '"${MYSQL_PASSWORD}"';
    GRANT 'developer' TO '"${MYSQL_USER}"'@'%'; 
    ALTER USER 'root'@'localhost' IDENTIFIED BY '"${MYSQL_ROOT_PASSWORD}"';
    FLUSH PRIVILEGES;
"

sleep 4;

mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown;

mariadbd-safe;