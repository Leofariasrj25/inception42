# syntax=docker/dockerfile:1

FROM alpine:3.17.4

RUN set -eux; \
    apk add --no-cache wget

RUN wget "https://github.com/google/cadvisor/releases/download/v0.47.2/cadvisor-v0.47.2-linux-amd64" -O cadvisor
RUN chmod +x ./cadvisor 

EXPOSE 8080
CMD ["./cadvisor"]

