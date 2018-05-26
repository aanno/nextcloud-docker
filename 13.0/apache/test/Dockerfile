# FROM nextcloud:13.0-apache
FROM aanno/nextcloud:13.0.2-apache

COPY *.sh /
COPY config/* /usr/src/nextcloud/config/
COPY 000-default.conf /etc/apache2/sites-available/

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
