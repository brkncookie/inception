#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/private/nginx-selfsigned.cert -subj "/C=OM/L=FR/O=42/OU=homefull/CN=carhub.fr"
echo "			Configuring Nginx.."
echo '
server {
    listen 443 ssl;
    listen [::]:443 ssl;

    server_name www.$DOMAIN_NAME $DOMAIN_NAME;

    ssl_certificate /etc/ssl/private/nginx-selfsigned.cert;
    ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
    ssl_protocols TLSv1.3;

    index index.php;
    root /var/www/html;

    location ~ [^/]\.php(/|$) {
            try_files $uri =404;
            fastcgi_pass wordpress:9000;
            include fastcgi_params;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }
}' >  /etc/nginx/sites-available/default

sed -i s/\$DOMAIN_NAME/$DOMAIN_NAME/g /etc/nginx/sites-available/default

echo "			Starting Nginx.."
nginx -g "daemon off;"
