# sleep 8;
# if  [ ! -f /var/www/wordpress/wp-config.php ]; then 
    
#     wp core --allow-root download --locale=sp_BR --force 
#     sleep 5;
#     while  [ ! -f /var/www/wordpress/wp-config.php ]; do   

#          wp core config --allow-root --dbname=wordpress --dbuser=$MARIA_LOGIN --dbpass=$MARIA_PASS --dbhost=mariadb:3306

#     done 
#     wp core install --allow-root --url='gsilva-v.42.fr' --title='WordPress for Inception' --admin_user=$WP_LOGIN --admin_password=$WP_PASS  --admin_email="admin@admin.fr" --path='/var/www/wordpress';
#     wp user create --allow-root $WPU_1LOGIN user2@user.com --user_pass=$WPU_1PASS --role=author
#     wp theme install --allow-root dark-mode --activate     
# fi 

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp 
chmod +x /usr/local/bin/wp

# Install Wordpress using WP-CLI
cd wordpress
wp core download --allow-root