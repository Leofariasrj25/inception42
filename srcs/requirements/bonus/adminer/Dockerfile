# syntax=docker/dockerfile:1

FROM debian:buster

ENV ADMINER_DOMAIN=${ADMINER_DOMAIN}

RUN set -eux; \
    apt-get update; \
    apt-get install -y adminer php\
                      php-mysql \
                      php-gd \
                      php-curl \
                      php-fpm \
                      php-zip \
                      php-json \
                      php-xml \
                      openssl \
                      php-mbstring \
                      php-intl \
                      vim \
                      curl \
                      wget \
                      ; \
    rm -rf /var/lib/apt/lists/*

COPY    ./conf/www.conf ./etc/php/7.3/fpm/pool.d/www.conf
RUN     set -eux; \
        mkdir -p /run/php/; \
        touch /run/php/php7.3-fpm.sock; \
        chown -R www-data:www-data /run/php/

COPY    --chmod=755 ./conf/entrypoint.sh /tmp/entrypoint.sh

RUN mkdir -v -p /var/www/html/$ADMINER_DOMAIN
WORKDIR /var/www/html/

EXPOSE 8888
ENTRYPOINT ["/tmp/entrypoint.sh"]
CMD ["php-fpm7.3", "-F"]

