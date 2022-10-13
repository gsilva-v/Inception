#!/bin/bash
set -x

apt-get install -y php php-curl php-imagick php-xml php-zip php-xmlreader php-ssh2 php-gd php-fpm php-mysql php-mbstring

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp 
chmod +x /usr/local/bin/wp

# Install Wordpress using WP-CLI'''
cd wordpress
wp core download --allow-root