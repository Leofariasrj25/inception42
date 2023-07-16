# syntax=docker/dockerfile:1

FROM alpine:3.17.4

# ==== mandatory =====
RUN     set -eux; \
        apk add --no-cache  mariadb \
                            mariadb-client \
                            mariadb-common \
                            mariadb-server-utils \
                            bash \
                            vim \
                            ; \
        rm -f /etc/mysql/my.cnf /etc/my.cf ~/my.cf

# ==== config =====
COPY    ./conf/my.cnf /etc/mysql/my.cnf
COPY    ./conf/my.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY    ./conf/my.cnf /root/.my.cnf 

RUN     set -eux; \
        mkdir -p /run/mysql /var/lib/mysql; \
        chmod 777 /var/lib/mysql

COPY    ./tools/mysql-install.sh /mysql-install.sh
RUN     chmod +x /mysql-install.sh

ENTRYPOINT ["./mysql-install.sh"]
EXPOSE 3306
# CMD ["mysqld", "--user=root", "--datadir=/var/lib/mysql"]
