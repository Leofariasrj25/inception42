# syntax=docker/dockerfile:1

FROM    debian:buster

ENV WP_DOMAIN=${WP_DOMAIN}

# ==== prerequesites ====
RUN     set -eux; \ 
        apt-get update && apt-get install -y php php-fpm \
                                      php-mysql \
                                      php-gd \
                                      php-curl \
                                      php-zip \
                                      php-json \
                                      php-xml \
                                      php-redis \
                                      openssl \
                                      php-mbstring \
                                      php-intl \
                                      vim \
                                      curl \
                                      wget \
                                      ; \
        rm -rf /var/lib/apt/lists/*

# ==== setup ====
COPY	conf/wp-pool.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY    ./conf/wp-config.php .
COPY    ./tools/wp-setup.sh .   

RUN		mkdir -p /var/www/html/$WP_DOMAIN
RUN		chmod 777 -R /var/www/html/$WP_DOMAIN
RUN		chown -R www-data:www-data /var/www/html/$WP_DOMAIN

RUN     chmod +x ./wp-setup.sh 
ENTRYPOINT ["./wp-setup.sh"]
EXPOSE 9000
