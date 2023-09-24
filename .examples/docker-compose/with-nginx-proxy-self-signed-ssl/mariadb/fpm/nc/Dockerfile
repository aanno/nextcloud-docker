FROM nextcloud:27.0.1-fpm-alpine

COPY myentrypoint.sh /myentrypoint.sh
ENTRYPOINT ["/myentrypoint.sh"]
CMD ["php-fpm"]
