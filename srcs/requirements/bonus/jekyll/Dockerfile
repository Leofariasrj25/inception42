# syntax=docker/dockerfile:1

FROM alpine:3.17.4 

RUN set -eux; \
    apk add --no-cache ruby-dev make build-base vim bash; \
    gem install jekyll bundler

RUN     mkdir -p /var/www
COPY    ./tools/site.tar /var/www/site.tar
COPY    ./conf/entrypoint.sh .
RUN     chmod +x ./entrypoint.sh

EXPOSE 4000
WORKDIR /var/www
ENTRYPOINT ["/entrypoint.sh"]

