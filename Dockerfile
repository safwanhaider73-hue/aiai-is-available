FROM python:3.12-slim

RUN apt-get update && \
    apt-get install -y apache2 && \
    a2enmod cgi && \
    sed -i 's/Listen 80/Listen 10000/' /etc/apache2/ports.conf && \
    sed -i 's/<VirtualHost \*:80>/<VirtualHost *:10000>/' /etc/apache2/sites-enabled/000-default.conf && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

COPY . /var/www/html/

RUN chmod +x /var/www/html/cgi-bin/*.cgi

EXPOSE 10000

CMD ["apachectl", "-D", "FOREGROUND"]
