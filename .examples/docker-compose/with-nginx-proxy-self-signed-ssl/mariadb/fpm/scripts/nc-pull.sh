#!/bin/bash -x

podman pull nextcloud:fpm-alpine
podman pull nextcloud:27.1.3-fpm-alpine
podman pull nginx:alpine
podman pull paulczar/omgwtfssl
podman pull redis:alpine
podman pull mariadb:10.6
podman pull mariadb:latest
podman pull docker.io/aanno/notify_push:v0.6.3
podman pull aanno/certbot-netcup:v2.6.0

