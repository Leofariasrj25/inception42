# syntax=docker/dockerfile:1

FROM debian:buster 

RUN set -eux; \
    apt-get update && apt-get install -y wget; \
    wget "https://dl.grafana.com/enterprise/release/grafana-enterprise-10.0.2.linux-amd64.tar.gz" -O grafana.tar.gz

RUN mkdir grafana-app
RUN tar -xvzf ./grafana.tar.gz -C grafana-app --strip-components=1
COPY ./conf/inception.ini /grafana-app/bin/inception.ini
COPY ./conf/entrypoint.sh .
RUN chmod +x entrypoint.sh 

EXPOSE 3000 
ENTRYPOINT ["./entrypoint.sh"]
