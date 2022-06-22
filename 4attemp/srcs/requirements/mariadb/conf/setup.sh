#!/bin/bash

set -x
DB_PATH=/var/lib/mysql/Wordpress 
if [ ! -d "$DB_PATH" ] 
then
	service mysql start

	# mysql -uroot -pSenha321 -h localhost
	# This sql file will setup 2 database users (root and db_user)
	mysql -e "CREATE DATABASE IF NOT EXISTS Wordpress;";
	mysql -e "grant all on *.* to 'root'@'localhost' with grant option;";
	mysql -e "create user 'root'@'%';";
	mysql -e "grant all on *.* to 'root'@'%' with grant option;";
	mysql -e "SET PASSWORD FOR 'root'@'localhost'=PASSWORD('Senha321');";
	mysql -e "SET PASSWORD FOR 'root'@'%'=PASSWORD('Senha321');";
	mysql -e "FLUSH PRIVILEGES;";

	mysql -uroot -pSenha321 -e  "CREATE USER 'gsilva'@'localhost' IDENTIFIED BY '123';";
	mysql -uroot -pSenha321 -e "CREATE USER 'gsilva'@'%' IDENTIFIED BY '123';";
	mysql -uroot -pSenha321 -e "GRANT ALL PRIVILEGES ON *.* TO 'gsilva'@'localhost';";
	mysql -uroot -pSenha321 -e "GRANT ALL PRIVILEGES ON *.* TO 'gsilva'@'%';";
	mysql -uroot -pSenha321 -e "FLUSH PRIVILEGES;";


	service mysql stop
	# This sql file will setup 2 users for wp (wp_root and pcunha)
	
	# This file will allow access to the database from outside the container
	# service mysql start && mysql -u$DB_ROOT -p$DB_PASS_ROOT -D$DB_NAME < /conf/wordpress.sql

	mysqladmin -uroot -pSenha321 shutdown
fi

exec "$@"