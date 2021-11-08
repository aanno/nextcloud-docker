#!/bin/bash -x

podman pull nextcloud:fpm-alpine
podman pull nextcloud:22.2.0-fpm-alpine
podman pull nginx:alpine
podman pull paulczar/omgwtfssl
podman pull redis:alpine
podman pull mariadb
podman pull docker.io/aanno/notify_push:v0.2.4
