#!/bin/bash -x

podman exec --user www-data nc_app_1 php /var/www/html/occ $*
