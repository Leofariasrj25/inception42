# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfarias- <lfarias-@student.42.rio>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/16 13:26:31 by lfarias-          #+#    #+#              #
#    Updated: 2023/07/18 03:32:37 by lfarias-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# syntax=docker/dockerfile:1

FROM    alpine:3.17.4

ENV WP_DOMAIN=${WP_DOMAIN}
ENV ADMINER_DOMAIN=${ADMINER_DOMAIN}

# requirements
RUN     set -eux; \
        apk add --no-cache nginx \
                           openssl \
                           bash \
                           vim

# setting up the user
RUN     set -eux; \
        mkdir -p /var/www/html/$WP_DOMAIN; \
        mkdir -p /var/www/html/$ADMINER_DOMAIN; \
        adduser -u 82 -S -D -G www-data www-data; \
        chown -R www-data:www-data /var/www/$WP_DOMAIN; \
        chown -R www-data:www-data /var/www/$ADMINER_DOMAIN

COPY    ./tools/openssl.cnf .
COPY    ./tools/create_certs.sh .

RUN     set -eux; \
        ./create_certs.sh; \
        rm -rf ./create_certs.sh ./openssl.cnf ./create_certs.sh

COPY    ./config/lfarias-.42.fr.conf /etc/nginx/http.d/default.conf
COPY    ./config/adminer.conf /etc/nginx/http.d/adminer.conf
COPY    ./config/profile.conf /etc/nginx/http.d/profile.conf

EXPOSE  443
EXPOSE  80
CMD     ["nginx", "-g", "daemon off;"]
