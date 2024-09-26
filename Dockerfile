FROM php:8.2-fpm-alpine3.19

RUN docker-php-ext-install mysqli pdo pdo_mysql

RUN apk add --no-cache apache2
RUN apk add --no-cache apache2-proxy apache2-proxy_fcgi
RUN a2enmod proxy
RUN a2enmod proxy_fcgi

COPY ./apache.conf /etc/apache2/conf.d/

EXPOSE 80
