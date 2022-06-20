if [ ! -d "/var/lib/mysql/wordpress" ]; then 
    
    mysql_install_db
    service mysql start
    
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_ROOT}'@'localhost' with grant option;" &&\
    mysql -e "CREATE USER '${DB_ROOT}'@'%';" &&\
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_ROOT}'@'%' with grant option;" &&\
	mysql -e "SET PASSWORD '${DB_ROOT}'@'localhost'=PASSWORD('${DB_PASS_ROOT})'"
	mysql -e "SET PASSWORD '${DB_ROOT}'@'%'=PASSWORD('${DB_PASS_ROOT})'"
	mysql -e "FLUSH PRIVILEGES;"

	mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'localhost' with grant option;" &&\
    mysql -e "CREATE USER '${DB_USER}'@'%';" &&\
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%' with grant option;" &&\
	mysql -e "SET PASSWORD '${DB_USER}'@'localhost'=PASSWORD('${DB_PASS_USER})'"
	mysql -e "SET PASSWORD '${DB_USER}'@'%'=PASSWORD('${DB_PASS_USER})'"
	mysql -e "FLUSH PRIVILEGES;"

	mysql -e "CREATE DATABASE IF NOT EXISTS '${DB_NAME}';" &&\
	mysql -e -u$DB_ROOT -p$DB_PASS_ROOT -D$DB_NAME < /conf/wordpress.sql
    service mysql stop 
fi
