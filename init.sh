#!/bin/bash
cd /var/www/html && composer install --no-interaction --optimize-autoloader --no-dev
cd /var/www/html && php artisan key:generate
cd /var/www/html && php artisan config:cache
cd /var/www/html && php artisan migrate --force
cd /var/www/html && php artisan db:seed --force
