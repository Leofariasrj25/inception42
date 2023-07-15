# syntax=docker/dockerfile:1

FROM    debian:buster

# ==== prerequesites ====
RUN     apt update -y && apt upgrade -y 
RUN     apt install php php-fpm php-mysql php-gd php-curl php-zip \
                    php-json php-xml openssl php-mbstring php-intl vim -y
RUN     apt install wget curl -y

# ==== setup ====
COPY	conf/wp-pool.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY    ./conf/wp-config.php .
COPY    ./tools/wp-setup.sh .   

RUN		mkdir -p /var/www/html
RUN		chmod 777 -R /var/www/html
RUN		chown -R www-data:www-data /var/www/html

RUN     chmod +x ./wp-setup.sh 
ENTRYPOINT ["./wp-setup.sh"]
EXPOSE 9000
