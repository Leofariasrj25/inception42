#!/bin/sh

wget "https://www.adminer.org/latest.php" -O adminer.php
mv latest.php adminer.php
chown -R www-data:www-data /var/www/html/adminer/adminer.php 
chmod 755 /var/www/html/adminer/adminer.php

exec "$@"
