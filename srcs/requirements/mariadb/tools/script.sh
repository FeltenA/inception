#!/bin/bash

service mysql start;

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;" > database_setup.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> database_setup.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' ;" >> database_setup.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" >> database_setup.sql
echo "FLUSH PRIVILEGES;" >> database_setup.sql
mysql < database_setup.sql

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

exec mysqld_safe
