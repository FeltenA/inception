#!/bin/bash

sleep 10
cd /var/www/html
wp core download --allow-root

sed -i -r "s/database_name_here/$MYSQL_DATABASE/1"   /wp-config.php
sed -i -r "s/username_here/$MYSQL_USER/1"  /wp-config.php
sed -i -r "s/password_here/$MYSQL_PASSWORD/1"    /wp-config.php
mv /wp-config.php /var/www/html
wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

/usr/sbin/php-fpm7.3 -F
