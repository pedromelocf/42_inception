FROM debian:oldstable

RUN apt-get update && apt-get install -y nginx nano 

COPY ./conf/nginx.conf /etc/nginx/nginx.conf 

EXPOSE 443

ENTRYPOINT ["bash", "-c", "while true; do sleep 3600; done"]