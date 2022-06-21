FROM debian:buster

COPY	./conf/ /tmp/conf/
COPY	./tools/ /tmp/tools/

WORKDIR /var/www/html/

ARG WP_DB_NAME empty
ARG WP_DB_USER empty
ARG WP_DB_PASSWORD empty
ARG DOMAIN_NAME empty
ARG WP_TITLE empty
ARG WP_ADMIN empty
ARG WP_ADMIN_PASSEWORD empty
ARG WP_ADMIN_EMAIL empty
ARG WP_USER empty
ARG WP_PASSWORD empty


RUN 	apt-get update -y && apt-get upgrade -y
RUN 	apt-get install -y php
RUN 	apt-get install -y php-mysql
RUN 	apt-get install -y tar
RUN 	apt-get install -y php-fpm
RUN		apt-get install -y wget


RUN		mkdir -p /var/www/html/wordpress

RUN  	bash /tmp/tools/setup.sh
RUN 	cp /tmp/conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN 	cp /tmp/conf/wp-config.php /var/www/html/wordpress/wp-config.php

RUN 	mkdir -p /var/run/php/

EXPOSE 9000

CMD     ["php-fpm7.3", "-F"]
