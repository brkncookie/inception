#!/bin/bash

sed -i 's/^bind-address\s*=.*/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start

echo "create database if not exists ${DB_NAME} ;" >> /tmp/db.sql
echo "create user if not exists '${DB_USER}'@'%' identified by '${DB_USER_PASSWORD}' ;" >> /tmp/db.sql
echo "grant all privileges on ${DB_NAME}.* to '${DB_USER}'@'%' ;" >> /tmp/db.sql
echo "flush privileges ;" >> /tmp/db.sql

mariadb < /tmp/db.sql

kill `pidof mariadbd`

exec mariadbd
