#!/bin/sh

sleep 5

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv -f wp-cli.phar /usr/local/bin/wp

/usr/local/bin/wp	core download --allow-root --path="/var/www/html/${WP_DOMAIN}"
rm -f /var/www/html/wp-config.php
cp ./wp-config.php /var/www/html/${WP_DOMAIN}/wp-config.php

/usr/local/bin/wp	core install --allow-root --path="/var/www/html/${WP_DOMAIN}" \
					--url=${WP_DOMAIN} \
					--title=${WORDPRESS_TITLE} \
					--admin_user=${WP_ADMIN_USER} \
					--admin_password=${WP_ADMIN_PASSWORD} \
					--admin_email=${WP_ADMIN_EMAIL} \
					--skip-email

/usr/local/bin/wp	user create --allow-root --path="/var/www/html/${WP_DOMAIN}" \
					${WP_USER} ${WP_EMAIL} --role=author --user_pass=${WP_PASSWORD}

# redis bonus
/usr/local/bin/wp   plugin install --allow-root redis-cache --activate --path="/var/www/html/${WP_DOMAIN}" && \
    cp /var/www/html/${WP_DOMAIN}/wp-content/plugins/redis-cache/includes/object-cache.php /var/www/html/${WP_DOMAIN}/wp-content/object-cache.php

# theme
/usr/local/bin/wp theme install "blocksy" --allow-root --path="/var/www/html/${WP_DOMAIN}" --activate 

# ensuring the socket is present
mkdir -p /run/php/ && touch /run/php/php7.3-fpm.sock
chown -R www-data:www-data /run/php/
chmod -R 777 /var/www/html
exec php-fpm7.3 -F
