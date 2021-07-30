#!/bin/bash -x

podman exec -it --user www-data nc_app_1 php /var/www/html/occ $*
