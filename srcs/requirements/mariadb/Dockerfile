# syntax=docker/dockerfile:1

FROM alpine:3.17.4

# ==== mandatory =====
RUN     apk update;
RUN     apk add mariadb mariadb-client mariadb-common mariadb-server-utils
RUN     rm -f /etc/mysql/my.cnf /etc/my.cf ~/my.cf

# ==== config =====
COPY    ./conf/my.cnf /etc/mysql/my.cnf
COPY    ./conf/my.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY    ./conf/my.cnf /root/.my.cnf 

RUN     mkdir -p /run/mysql /var/lib/mysql
RUN     chmod 777 /var/lib/mysql

COPY    ./tools/mysql-install.sh /mysql-install.sh
RUN     chmod +x /mysql-install.sh

ENTRYPOINT ["./mysql-install.sh"]
EXPOSE 3306
# CMD ["mysqld", "--user=root", "--datadir=/var/lib/mysql"]
