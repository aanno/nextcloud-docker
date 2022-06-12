#!/bin/bash -x

podman pull nextcloud:fpm-alpine
podman pull nextcloud:23.0.5-fpm-alpine
podman pull nginx:alpine
podman pull paulczar/omgwtfssl
podman pull redis:alpine
podman pull mariadb:10.6
podman pull mariadb:10.7
podman pull mariadb:latest
podman pull docker.io/aanno/notify_push:v0.3.0
podman pull aanno/certbot-netcup:v1.23.0
