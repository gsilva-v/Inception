FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server

RUN		rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY 	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
# RUN		mysql_install_db
# RUN	 	service mysql start
# RUN	    mysql -e "CREATE USER 'Buzz'@'localhost' identified by 'Lightyear95';" 
# RUN		mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;"
# RUN		mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'Buzz'@'%' IDENTIFIED BY 'Lightyear95';"
# RUN		mysql -e "FLUSH PRIVILEGES;"
# RUN	   	service mysql stop 
# RUN		mysqld
COPY ./conf/setup.sh .
RUN chmod 777 setup.sh 
EXPOSE 3306

CMD ["sh", "/setup.sh"]

ENTRYPOINT ["mysqld"]