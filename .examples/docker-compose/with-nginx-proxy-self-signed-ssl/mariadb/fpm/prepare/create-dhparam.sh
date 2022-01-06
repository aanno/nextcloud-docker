#!/bin/sh -x

set -xe

GIT_ROOT=`git rev-parse --show-toplevel`

# ATTENTION: pom MUST be named 'nc' - otherwise the volume has the wrong name!
PNAME="nc"

pushd "$GIT_ROOT/.examples/docker-compose/with-nginx-proxy-self-signed-ssl/mariadb/fpm"

source "scripts/env.sh"

pushd prepare
  podman pod rm -f "$PNAME" || true
  # podman rmi localhost/dhparam_certs localhost/nc_certs nc_openssl_1 || true
  podman-compose -p "$PNAME" -f create-dhparam-compose.yml up
  podman pod rm -f "$PNAME" 
  # podman rmi localhost/dhparam_openssl localhost/nc_certs nc_openssl_1 || true
popd

popd 
