# syntax=docker/dockerfile:1

FROM    alpine:3.17.4

# requirements
RUN     apk update
RUN     apk add nginx openssl

# setting up the user
RUN     mkdir -p mkdir /var/www/html
RUN     chown -R nginx:nginx /var/www
COPY    ./tools/openssl.cnf .
COPY    ./tools/create_certs.sh .
RUN     ./create_certs.sh
RUN     rm -rf ./create_certs.sh ./openssl.cnf ./create_certs.sh
COPY    ./config/lfarias-.42.fr.conf /etc/nginx/http.d/default.conf

EXPOSE  443
CMD     ["nginx", "-g", "daemon off;"]
