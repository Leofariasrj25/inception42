# syntax=docker/dockerfile:1

FROM    alpine:3.17.4

# requirements
RUN     set -eux; \
        apk add --no-cache nginx \
                           openssl \
                           bash \
                           vim

# setting up the user
RUN     set -eux; \
        mkdir -p /var/www/html; \
        chown -R nginx:nginx /var/www

COPY    ./tools/openssl.cnf .
COPY    ./tools/create_certs.sh .

RUN     set -eux; \
        ./create_certs.sh; \
        rm -rf ./create_certs.sh ./openssl.cnf ./create_certs.sh

COPY    ./config/lfarias-.42.fr.conf /etc/nginx/http.d/default.conf

EXPOSE  443
CMD     ["nginx", "-g", "daemon off;"]
