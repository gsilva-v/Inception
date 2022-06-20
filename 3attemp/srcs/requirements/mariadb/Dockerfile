FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server

COPY	./conf/ /tmp/conf/
RUN		rm /etc/mysql/mariadb.conf.d/50-server.cnf
RUN 	cp ./tmp/conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN 	chmod 777 /tmp/conf/setup.sh


EXPOSE 3306

ENTRYPOINT [ "/tmp/conf/setup.sh" ]

CMD ["mysqld"]

