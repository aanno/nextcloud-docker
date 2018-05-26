# FROM nextcloud:13.0-apache
FROM aanno/nextcloud:13.0.2-apache

COPY *.sh /
COPY config/* /usr/src/nextcloud/config/

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
