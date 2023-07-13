# syntax=docker/dockerfile:1

FROM    alpine:3.17.4

# requirements
RUN     apk update
RUN     apk add nginx openssl

# setting up the user
RUN     adduser -D -g 'www' www
RUN     mkdir /www
RUN     chown -R www:www /var/lib/nginx
RUN     chown -R www:www /www

COPY    ./tools/openssl.cnf .
COPY    ./tools/create_certs.sh .
RUN     ./create_certs.sh
RUN     rm -rf ./create_certs.sh ./openssl.cnf ./create_certs.sh
COPY    ./config/nginx.conf ./etc/nginx/
COPY    ./tools/index.html ./www/

EXPOSE  443
CMD     ["nginx", "-g", "daemon off;"]
