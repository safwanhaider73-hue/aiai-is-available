FROM python:3.12-slim

RUN apt-get update && \
    apt-get install -y apache2 && \
    a2enmod cgi && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

COPY . /var/www/html/

RUN chmod +x /var/www/html/cgi-bin/*.cgi 2>/dev/null || true

EXPOSE 10000

CMD ["apachectl", "-D", "FOREGROUND"]
