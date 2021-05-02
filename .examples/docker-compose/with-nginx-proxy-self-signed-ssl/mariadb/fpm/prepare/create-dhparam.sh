#!/bin/sh -x

# ATTENTION: pom MUST be named 'nc' - otherwise the volume has the wrong name!
PNAME="nc"

podman pod rm -f "$PNAME"
# podman rmi localhost/dhparam_certs localhost/nc_certs nc_openssl_1 || true
podman-compose -p "$PNAME" -f create-dhparam-compose.yml up
podman pod rm -f "$PNAME" 
# podman rmi localhost/dhparam_openssl localhost/nc_certs nc_openssl_1 || true
