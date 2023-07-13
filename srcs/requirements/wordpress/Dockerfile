# syntax=docker/dockerfile:1

FROM    alpine:3.17.4

# ==== prerequesites ====
RUN apk update
#RUN apk add php7 php7-fpm php7-opcache php7-mysqli php7-session \
#			php7-iconv php7-json php7-gd php7-curl php7-xml php7-common \
#			php7-imap php7-cgi php7-pdo php7-pdo_mysql php7-soap \
#			php7-xmlrpc php7-posix php7-mcrypt php7-redis php7-gettext \
#			php7-ldap php7-ctype php7-dom php7-phar php7-gd php7-zlib

RUN apk add curl wget

RUN     mkdir -p /var/www/html/${WORDPRESS_DOMAIN}/public_html

