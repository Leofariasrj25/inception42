# syntax=docker/dockerfile:1

FROM debian:buster

RUN     set -eux; \
        apt-get update; \
        apt-get install -y redis vim; \
        rm -rf /var/lib/apt/lists/*

COPY    ./conf/redis.conf /etc/redis.conf
RUN     chmod 755 /etc/redis.conf

EXPOSE 6379
USER redis
CMD ["redis-server", "--protected-mode no"]
