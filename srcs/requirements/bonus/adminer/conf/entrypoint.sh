#!/bin/sh

wget "https://www.adminer.org/latest.php" -O adminer.php
mv adminer.php ./${ADMINER_DOMAIN}/adminer.php
chown -R www-data:www-data /var/www/html/${ADMINER_DOMAIN}/adminer.php 
chmod 755 /var/www/html/${ADMINER_DOMAIN}/adminer.php

exec "$@"
