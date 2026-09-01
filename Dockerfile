FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y apache2 && \
    rm -rf /var/lib/apt/lists/*

COPY . /var/www/html/

RUN rm -f /var/www/html/index.html

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
