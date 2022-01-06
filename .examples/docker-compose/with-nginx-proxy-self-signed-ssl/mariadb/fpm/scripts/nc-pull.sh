#!/bin/bash -x

podman pull nextcloud:fpm-alpine
podman pull nextcloud:23.0.0-fpm-alpine
podman pull nginx:alpine
podman pull paulczar/omgwtfssl
podman pull redis:alpine
podman pull mariadb:10.6.5
podman pull mariadb:10.7.1
podman pull mariadb:latest
podman pull docker.io/aanno/notify_push:v0.3.0
podman pull aanno/certbot-netcup:v1.21.0
