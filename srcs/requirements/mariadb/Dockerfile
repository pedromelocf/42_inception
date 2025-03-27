FROM debian:oldstable

RUN apt-get update && apt-get install -y mariadb-server sudo

RUN chown -R mysql:mysql /var/lib/mysql

COPY ./tools/dbscript.sh /usr/local/bin/dbscript.sh

RUN chmod +x /usr/local/bin/dbscript.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/dbscript.sh"]