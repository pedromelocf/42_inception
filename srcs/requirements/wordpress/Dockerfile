FROM debian:oldstable

RUN apt-get update && apt-get install -y --no-install-recommends php-fpm curl sudo ca-certificates php-mysql

RUN sudo mkdir -p /srv/www && \
    sudo chown -R www-data: /srv/www

RUN curl https://wordpress.org/latest.tar.gz | \ 
    sudo -u www-data tar zx -C /srv/www

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    sudo mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/wpscript.sh /usr/local/bin/wpscript.sh

RUN chmod +x /usr/local/bin/wpscript.sh /usr/local/bin/wp

ENTRYPOINT ["/usr/local/bin/wpscript.sh"]