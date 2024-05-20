FROM docker.io/nextcloud:27.1.9-fpm-alpine

COPY myentrypoint.sh /myentrypoint.sh
ENTRYPOINT ["/myentrypoint.sh"]
CMD ["php-fpm"]
