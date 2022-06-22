#!/bin/bash
# Wordpress setup
set -x
# Change vars needed to access Mariadb
cp /tmp/conf/wp-config.php swap

rm /tmp/conf/wp-config.php
sed -i "s/aaa/$DB_NAME/g" swap
sed -i "s/bbb/$DB_USER/g" swap
sed -i "s/ccc/$DB_PASS_USER/g" swap
sed -i "s/ddd/$DB_HOST/g" swap

mv swap /tmp/conf/wp-config.php
