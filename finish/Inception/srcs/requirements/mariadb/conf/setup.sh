#!/bin/bash

set -x

DB_PATH=/var/lib/mysql/${DB_NAME} 
if [ ! -d "$DB_PATH" ] 
then
	service mysql start

	# mysql -uroot -p${DB_PASS_ROOT} -h localhost
	# This sql file will setup 2 database users (root and db_user)
	mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};";
	mysql -e "grant all on *.* to '"${DB_ROOT}"'@'localhost' with grant option;";
	mysql -e "create user '"${DB_ROOT}"'@'%';";
	mysql -e "grant all on *.* to '"${DB_ROOT}"'@'%' with grant option;";
	mysql -e "SET PASSWORD FOR '"${DB_ROOT}"'@'localhost'=PASSWORD('"${DB_PASS_ROOT}"');";
	mysql -e "SET PASSWORD FOR '"${DB_ROOT}"'@'%'=PASSWORD('"${DB_PASS_ROOT}"');";
	mysql -e "FLUSH PRIVILEGES;";

	mysql -u${DB_ROOT} -p${DB_PASS_ROOT} -e  "CREATE USER '"${DB_USER}"'@'localhost' IDENTIFIED BY '"${DB_PASS_USER}"';";
	mysql -u${DB_ROOT} -p${DB_PASS_ROOT} -e "CREATE USER '"${DB_USER}"'@'%' IDENTIFIED BY '"${DB_PASS_USER}"';";
	mysql -u${DB_ROOT} -p${DB_PASS_ROOT} -e "GRANT ALL PRIVILEGES ON *.* TO '"${DB_USER}"'@'localhost';";
	mysql -u${DB_ROOT} -p${DB_PASS_ROOT} -e "GRANT ALL PRIVILEGES ON *.* TO '"${DB_USER}"'@'%';";
	mysql -u${DB_ROOT} -p${DB_PASS_ROOT} -e "FLUSH PRIVILEGES;";


	# This file will allow access to the database from outside the container
	mysql -u$DB_ROOT -p$DB_PASS_ROOT -D$DB_NAME < /tmp/conf/wordpress.sql
	service mysql stop
	mysqladmin -u${DB_ROOT} -p${DB_PASS_ROOT} shutdown
fi
# service mysql start
# mysqldump -uroot -pSenhafacil321 Wordpress > /var/lib/mysql/wordpress.sql 

exec "$@"