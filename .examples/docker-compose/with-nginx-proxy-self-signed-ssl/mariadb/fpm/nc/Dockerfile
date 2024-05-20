FROM docker.io/nextcloud:27.1.3-fpm-alpine

COPY myentrypoint.sh /myentrypoint.sh
ENTRYPOINT ["/myentrypoint.sh"]
CMD ["php-fpm"]
