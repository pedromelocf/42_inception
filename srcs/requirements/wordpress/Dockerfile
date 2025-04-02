FROM debian:oldstable

RUN apt-get update && apt-get install -y --no-install-recommends php-fpm curl sudo ca-certificates 

RUN sudo mkdir -p /srv/www && sudo chown -R www-data: /srv/www

RUN curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www

EXPOSE 9000

CMD ["bash", "-c", "while true; do sleep 3600; done"]