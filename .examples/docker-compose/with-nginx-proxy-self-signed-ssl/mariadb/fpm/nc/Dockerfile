FROM nextcloud:23.0.2-fpm-alpine

COPY myentrypoint.sh /myentrypoint.sh
ENTRYPOINT ["/myentrypoint.sh"]
CMD ["php-fpm"]
