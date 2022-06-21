#!/bin/bash
	# service mysql start
	# sleep 5
	# # mysql -uroot -pSenha321 -h localhost
	# # This sql file will setup 2 database users (root and db_user)
	# mysql -e "grant all on *.* to '"${DB_ROOT}"'@'localhost' with grant option;";
	# mysql -e "create user '"${DB_ROOT}"'@'%';";
	# mysql -e "grant all on *.* to '"${DB_ROOT}"'@'%' with grant option;";
	# mysql -e "SET PASSWORD FOR '"${DB_ROOT}"'@'localhost'=PASSWORD('"${DB_PASS_ROOT}"');";
	# mysql -e "SET PASSWORD FOR '"${DB_ROOT}"'@'%'=PASSWORD('"${DB_PASS_ROOT}"');";
	# mysql -e "FLUSH PRIVILEGES;";

	# mysql -uroot -pSenha321 -e  "CREATE USER '"${DB_USER}"'@'localhost' IDENTIFIED BY '"${DB_PASS_USER}"';";
	# mysql -e "CREATE USER '"${DB_USER}"'@'%' IDENTIFIED BY '"${DB_PASS_USER}"';";
	# mysql -e "GRANT ALL PRIVILEGES ON *.* TO '"${DB_USER}"'@'localhost';";
	# mysql -e "GRANT ALL PRIVILEGES ON *.* TO '"${DB_USER}"'@'%';";
	# mysql -e "FLUSH PRIVILEGES;";

	# mysql -e "CREATE DATABASE IF NOT EXISTS '${DB_NAME}';";

	# service mysql stop
	# # This sql file will setup 2 users for wp (wp_root and pcunha)
	
	# # This file will allow access to the database from outside the container
	# # service mysql start && mysql -u$DB_ROOT -p$DB_PASS_ROOT -D$DB_NAME < /conf/wordpress.sql

	# mysqladmin -u${DB_ROOT} -p${DB_PASS_ROOT} shutdown

set -x

#  chown -R mysql:mysql /var/lib/mysql
DB_PATH=/var/lib/mysql/WORDPRESS 
# if [ ! -d "$DB_PATH" ] 
# then
	# /etc/init.d/mysql start
	service mysql start;
	# -- Create database
	mysql -e "CREATE DATABASE IF NOT EXISTS WORDPRESS;"
	# -- Create database admin user and set admin priveleges
	mysql -e "CREATE USER 'owner'@'localhost';"
	mysql -e "SET PASSWORD FOR 'owner'@'localhost' = PASSWORD('pass');"
	mysql -e "GRANT ALL PRIVILEGES ON WORDPRESS.* TO 'owner'@'localhost' IDENTIFIED BY 'pass';"
	mysql -e "GRANT ALL ON WORDPRESS.* to 'owner'@'%' IDENTIFIED BY 'pass';"
	mysql -e "FLUSH PRIVILEGES;"
	# -- Create database lambda user and set read privileges
	mysql -e "CREATE USER 'gsilva'@'localhost' IDENTIFIED BY '123';"
	mysql -e "GRANT SELECT ON *.* TO 'gsilva'@'localhost';"
	mysql -e "FLUSH PRIVILEGES;"
	service mysql stop
	
# fi

exec "$@"