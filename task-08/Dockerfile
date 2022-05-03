FROM debian:latest

RUN apt-get update && apt-get install apache2 php -y && rm /var/www/html/index.html

COPY index.php /var/www/html

EXPOSE 80

CMD apache2ctl -D FOREGROUND
