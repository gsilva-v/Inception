#!/bin/bash
set -x

DB_PATH=/var/lib/mysql/${DB_NAME} 
if [ ! -d "$DB_PATH" ] 
then
    # # This sql file will setup 2 database users (root and db_user)
	# echo "grant all on *.* to '"${DB_ROOT}"'@'localhost' with grant option;" >> setup.sql
	# echo "create user '"${DB_ROOT}"'@'%';" >> setup.sql
	# echo "grant all on *.* to '"${DB_ROOT}"'@'%' with grant option;" >> setup.sql
	# echo "SET PASSWORD FOR '"${DB_ROOT}"'@'localhost'=PASSWORD('"${DB_PASS_ROOT}"');" >> setup.sql
	# echo "SET PASSWORD FOR '"${DB_ROOT}"'@'%'=PASSWORD('"${DB_PASS_ROOT}"');" >> setup.sql
	# echo "FLUSH PRIVILEGES;" >> setup.sql
	# echo  "\n" >> setup.sql
	# echo "CREATE USER '"${DB_USER}"'@'localhost' IDENTIFIED BY '"${DB_PASS_USER}"';" >> setup.sql
	# echo "CREATE USER '"${DB_USER}"'@'%' IDENTIFIED BY '"${DB_PASS_USER}"';" >> setup.sql
	# echo "GRANT ALL PRIVILEGES ON *.* TO '"${DB_USER}"'@'localhost';" >> setup.sql
	# echo "GRANT ALL PRIVILEGES ON *.* TO '"${DB_USER}"'@'%';" >> setup.sql
	# echo "FLUSH PRIVILEGES;" >> setup.sql
	# echo  "\n" >> setup.sql
	# echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" >> setup.sql

	# # This sql file will setup 2 users for wp (wp_root and pcunha)
	# service mysql start && mysql < setup.sql

	# # This file will allow access to the database from outside the container
	# # service mysql start && mysql -u$DB_ROOT -p$DB_ROOT_PASSWORD -D$DB_NAME < /conf/wordpress.sql

	# mysqladmin -u${DB_ROOT} -p${DB_PASS_ROOT} shutdown
	mysql_install_db
    service mysql start
    
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_ROOT}'@'localhost' with grant option;" &&\
	mysql -e "SET PASSWORD '${DB_ROOT}'@'localhost'=PASSWORD('${DB_PASS_ROOT})'"
    mysql -e "CREATE USER '${DB_ROOT}'@'%' identified by '${DB_PASS_ROOT}';" &&\
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_ROOT}'@'%'=PASSWORD('${DB_PASS_ROOT}');" &&\
	mysql -e "FLUSH PRIVILEGES;"

    mysql -e "CREATE USER '${DB_USER}'@'localhost' identified by '${DB_PASS_USER}';" &&\
    mysql -e "CREATE USER '${DB_USER}'@'%' identified by '${DB_PASS_USER}';" &&\
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'localhost';" &&\
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%';" &&\
	mysql -e "FLUSH PRIVILEGES;"

	mysql -e "CREATE DATABASE IF NOT EXISTS '${DB_NAME}';" 
	# mysql -e -u$DB_ROOT -p$DB_PASS_ROOT -D$DB_NAME < /conf/wordpress.sql
    service mysql stop 
fi

exec "$@"