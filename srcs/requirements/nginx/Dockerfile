FROM debian:buster

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install nginx -y
RUN apt-get install openssl -y

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=afelten.42.fr/UID=afelten"

RUN mkdir -p /var/run/nginx
