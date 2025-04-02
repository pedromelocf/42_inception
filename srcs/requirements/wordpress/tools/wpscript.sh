#!/bin/sh

if [ ! -f /srv/www/wordpress/wp-config.php ]; then
  echo "Generating wp-config.php file. Connecting to mysql database:";
  wp config create --path=/srv/www/wordpress --dbname=WordPress --dbuser=$WORDPRESS_USER --dbpass=$WORDPRESS_PASSWORD --dbhost=$WORDPRESS_HOST;

  if [ -f /srv/www/wordpress/wp-config.php ]; then
    echo "wp-config.php generated succefully.";
  else
    echo "Generating wp-config.php failed. Check DB connection";
    exit 1;
  fi
else
  echo "wp-config.php file already exists";
fi