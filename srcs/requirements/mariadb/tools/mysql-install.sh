#!/bin/sh

mkdir -p /home/lfarias-/data/database
mkdir -p /home/lfarias-/data/www

mkdir -p /var/run/mysqld/
touch /var/run/mysqld/mysqld.sock
chmod 770 /var/run/mysqld/mysqld.sock

/usr/bin/mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql
/usr/bin/mysqld --user=root --datadir=/var/lib/mysql & sleep 2

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MARIADB_USER}\`@'localhost' IDENTIFIED BY '${MARIADB_USER_PASS}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO \`${MARIADB_USER}\`@'%' IDENTIFIED BY '${MARIADB_USER_PASS}';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "CREATE DATABASE IF NOT EXISTS \`${GRAFANA_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${GRAFANA_USER}\`@'localhost' IDENTIFIED BY '${GRAFANA_USER_PASS}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${GRAFANA_DATABASE}\`.* TO \`${GRAFANA_USER}\`@'%' IDENTIFIED BY '${GRAFANA_USER_PASS}';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

pkill mysqld
/usr/bin/mysqld --user=root --datadir=/var/lib/mysql
