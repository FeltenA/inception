FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install wget -y
RUN apt install -y php7.3 php-fpm php-mysql mariadb-client

RUN wget https://wordpress.org/latest.tar.gz -P /var/www
RUN cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz
RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/script.sh /
RUN chmod +x /script.sh
ENTRYPOINT ["/script.sh"]

CMD ["/usr/sbin/php-fpm7.3", "-F"]
