#!/bin/bash -x

podman pull docker.io/nextcloud:fpm-alpine
podman pull docker.io/nextcloud:27.1.3-fpm-alpine
podman pull docker.io/nginx:alpine
podman pull docker.io/paulczar/omgwtfssl
podman pull docker.io/redis:alpine
podman pull docker.io/mariadb:10.6
podman pull docker.io/mariadb:latest
podman pull docker.io/aanno/notify_push:v0.6.11
podman pull docker.io/aanno/certbot-netcup:v2.10.0

