FROM debian:oldstable

RUN apt-get update && apt-get install -y mariadb-server

RUN chown -R mysql:mysql /var/lib/mysql && chmod -R 755 /var/lib/mysql

COPY ./tools/dbscript.sh /usr/local/bin/dbscript.sh

COPY ./conf/my.cnf /etc/mysql/my.cnf

RUN chmod +x /usr/local/bin/dbscript.sh /etc/init.d/mariadb

ENTRYPOINT ["/usr/local/bin/dbscript.sh"]