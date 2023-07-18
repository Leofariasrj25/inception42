# syntax=docker/dockerfile:1

FROM alpine:3.17.4

RUN set -eux; \
    apk add --no-cache vsftpd

COPY ./conf/entrypoint.sh .
COPY ./conf/vsftpd.conf /etc/vsftpd.conf
RUN set -eux; \
    chmod +x ./entrypoint.sh;


EXPOSE 20-21
EXPOSE 990
EXPOSE 10090-11000

ENTRYPOINT ["./entrypoint.sh"]
