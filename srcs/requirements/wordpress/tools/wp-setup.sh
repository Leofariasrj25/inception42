#!/bin/sh

sleep 5

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv -f wp-cli.phar /usr/local/bin/wp

/usr/local/bin/wp	core download --allow-root --path="/var/www/html/"
rm -f /var/www/html/wp-config.php
cp ./wp-config.php /var/www/html/wp-config.php

/usr/local/bin/wp	core install --allow-root --path="/var/www/html/" \
					--url=${WP_DOMAIN} \
					--title=${WORDPRESS_TITLE} \
					--admin_user=${WP_ADMIN_USER} \
					--admin_password=${WP_ADMIN_PASSWORD} \
					--admin_email=${WP_ADMIN_EMAIL} \
					--skip-email

/usr/local/bin/wp	user create --allow-root --path="/var/www/html" \
					${WP_USER} ${WP_EMAIL} --role=author --user_pass=${WP_PASSWORD}

# ensuring the socket is present
mkdir -p /run/php/ && touch /run/php/php7.3-fpm.sock
chown -R www-data:www-data /run/php/
chmod -R 777 /var/www/html
exec php-fpm7.3 -F
