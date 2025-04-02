#!/bin/sh

/etc/init.d/mariadb start

sleep 2;

mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" -e "
    ALTER USER 'root'@'localhost' IDENTIFIED BY '"${MYSQL_ROOT_PASSWORD}"';
    GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
    CREATE DATABASE IF NOT EXISTS WordPress; 
    CREATE ROLE IF NOT EXISTS developer; 
    GRANT ALL PRIVILEGES ON WordPress.* TO developer; 
    CREATE USER IF NOT EXISTS '"${MYSQL_USER}"'@'localhost';
    ALTER USER '"${MYSQL_USER}"'@'localhost' IDENTIFIED BY '"${MYSQL_PASSWORD}"';
    GRANT 'developer' TO '"${MYSQL_USER}"'@'localhost'; 
    FLUSH PRIVILEGES;
"