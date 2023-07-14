# syntax=docker/dockerfile:1

FROM    debian:buster

# ==== prerequesites ====
RUN     apt update -y && apt upgrade -y 
RUN     apt install php php-fpm php-mysql php-gd php-curl php-zip -y
RUN     apt install wget curl -y

# ==== setup ====
RUN     mkdir -p /var/www/
RUN		mkdir -p /var/www/html
# RUN		adduser -u 82 -D -S -G www-data www-data
# RUN		chmod 777 -R /var/www/html
# RUN		chown -R www-data:www-data /var/www/html

EXPOSE 9000
