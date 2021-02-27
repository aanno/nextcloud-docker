#!/bin/bash -x

podman pull nextcloud:fpm-alpine
podman pull nginx:alpine
podman pull paulczar/omgwtfssl
podman pull redis:alpine
podman pull mariadb
