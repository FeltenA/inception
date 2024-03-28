FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install wget -y
RUN apt install -y php7.3 php-fpm php-mysql mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
RUN mkdir -p /run/php

COPY tools/script.sh /
COPY tools/wp-config.php /
RUN chmod +x /script.sh /wp-config.php
ENTRYPOINT ["/script.sh"]
