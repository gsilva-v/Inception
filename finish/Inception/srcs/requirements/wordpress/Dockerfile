FROM debian:buster

COPY	./conf/ /tmp/conf/
COPY	./tools/ /tmp/tools/

WORKDIR /var/www/html/

ARG DB_NAME
ARG DB_USER
ARG DB_PASS_USER
ARG DB_HOST

RUN 	apt-get update -y && apt-get upgrade -y
RUN 	apt-get install -y php
RUN 	apt-get install -y php-mysql
RUN 	apt-get install -y tar
RUN 	apt-get install -y php-fpm
RUN		apt-get install -y wget


RUN		mkdir -p /var/www/html/wordpress

RUN  	bash /tmp/conf/wpswap.sh
RUN 	cp /tmp/conf/wp-config.php /var/www/html/wordpress/wp-config.php
RUN  	bash /tmp/tools/setup.sh
RUN 	cp /tmp/conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN 	mkdir -p /var/run/php/

EXPOSE 9000

CMD     ["php-fpm7.3", "-F"]
