
# syntax=docker/dockerfile:1

FROM alpine:3.17.4

RUN set -eux; \
    apk add --no-cache wget

RUN mkdir prometheus-app
RUN wget "https://github.com/prometheus/prometheus/releases/download/v2.45.0/prometheus-2.45.0.linux-amd64.tar.gz" -O prometheus.tar.gz
RUN tar -xvzf ./prometheus.tar.gz -C prometheus-app --strip-components=1
COPY ./conf/prometheus.yml /prometheus-app/prometheus.yml
WORKDIR /prometheus-app
RUN chmod +x ./prometheus

EXPOSE 9090 
CMD ["./prometheus", "--config.file=prometheus.yml"]

