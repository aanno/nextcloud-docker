#!/bin/sh -x

podman pod rm -f dhparam
podman rmi localhost/dhparam_openssl
podman-compose -p dhparam -f create-dhparam-compose.yml up
podman pod rm -f dhparam
podman rmi localhost/dhparam_openssl
