#!/bin/sh

sleep 10;
cd /srv/www/wordpress;

if [ ! -f wp-config.php ]; then
  echo "Generating wp-config.php file. Connecting to mysql database:";
  wp config create --dbname=WordPress --dbuser=$WORDPRESS_MYSQL_USER --dbpass=$WORDPRESS_MYSQL_PASSWORD --dbhost=$WORDPRESS_MYSQL_HOST --allow-root;

  if [ -f wp-config.php ]; then
    echo "wp-config.php generated succefully.";
  else
    echo "Generating wp-config.php failed. Check DB connection";
    exit 1;
  fi
else
  echo "wp-config.php file already exists";
fi

if ! wp core is-installed --allow-root; then
  echo "Installing wp core.";
  wp core install --url=wpclidemo.dev --title="WP-CLI" --admin_user=$WORDPRESS_USER --admin_password=$WORDPRESS_PASSWORD --admin_email=info@wp-cli.org --allow-root; 

  if wp core is-installed --allow-root; then
    echo "Wp core installed succefully.";
  else
    echo "Wp core installing failed."
    exit 2;
  fi
else
  echo "wp core already installed";
fi

wp plugin update --all --allow-root;