FROM debian:bullseye

RUN apt-get update && apt-get install -y wordpress php-common 

CMD [ "cat /wp-includes/version.php", "&&", "php", "--version"]