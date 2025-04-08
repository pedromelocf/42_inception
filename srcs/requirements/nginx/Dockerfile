FROM debian:oldstable

RUN apt-get update && apt-get install -y nginx 

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod -R 755 /srv/ && chmod +x /etc/nginx/nginx.conf

EXPOSE 8080

ENTRYPOINT ["nginx"]

CMD ["-g", "daemon off;"]