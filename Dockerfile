FROM php:8.2-fpm-alpine3.19

RUN docker-php-ext-install mysqli pdo pdo_mysql

RUN apk add --no-cache apache2 apache2-utils

COPY ./apache.conf /etc/apache2/conf.d/

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]
