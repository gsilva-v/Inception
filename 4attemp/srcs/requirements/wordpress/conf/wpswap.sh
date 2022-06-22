#!/bin/bash
# Wordpress setup
set -x
# Change vars needed to access Mariadb
cp /tmp/conf/wp-config.php swap

rm /tmp/conf/wp-config.php
sed -i "s/aaa/Wordpress/g" swap
sed -i "s/bbb/gsilva/g" swap
sed -i "s/ccc/123/g" swap
sed -i "s/ddd/mariadb/g" swap

mv swap  /var/www/html/wordpress/wp-config.php
