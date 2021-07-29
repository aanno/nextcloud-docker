#!/bin/sh -x

set -xe

GIT_ROOT=`git rev-parse --show-toplevel`

# ATTENTION: pom MUST be named 'nc' - otherwise the volume has the wrong name!
PNAME="nc"

pushd "$GIT_ROOT/.examples/docker-compose/with-nginx-proxy-self-signed-ssl/mariadb/fpm"

source "scripts/env.sh"

pushd prepare
  podman pod rm -f "$PNAME" || true
  podman-compose -p "$PNAME" -f create-dummy-cert-compose.yml up
  podman pod rm -f "$PNAME" 
popd

popd
