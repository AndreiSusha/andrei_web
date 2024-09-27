# Using the image that comes with Apache and PHP pre-configured
FROM php:8.2-apache

# Execute 2 commands in a single RUN to reduce layers
RUN \
    set -eux; \
    \
    docker-php-ext-install mysqli pdo pdo_mysql

COPY ./apache.conf /etc/apache2/sites-available/000-default.conf

# Expose port 80 for HTTP traffic
EXPOSE 80

# Ensuring the container can respond to HTTP requests, marking it unhealthy otherwise
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost/ || exit 1
