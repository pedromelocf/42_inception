FROM debian:oldstable

RUN apt-get update

#  && apt-get install -y php-fpm

RUN chown -R wp:wp /var/wordpress

EXPOSE 9000

CMD ["bash", "-c", "while true; do sleep 3600; done"]