#!/bin/bash

mkdir -p /var/www/html && cd /var/www/html

curl -o /usr/local/bin/wp ttps://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x /usr/local/bin/wp 

wp core download --allow-root
wp config set --allow-root --dbhost=${DB_HOST} --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD}
wp core install --allow-root --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN} \
	--admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --skip-email
wp user create --allow-root $WP_USER $WP_EMAIL --user_pass=${WP_USER_PASSWORD} --role=author



exec php-fpm7.3 -F
