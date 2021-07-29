#!/bin/bash -x

set -xe

GIT_ROOT=`git rev-parse --show-toplevel`

pushd "$GIT_ROOT/.examples/docker-compose/with-nginx-proxy-self-signed-ssl/mariadb/fpm"

source "scripts/env.sh"

rm web/nginx.conf || true
envsubst <web/nginx.in.conf >web/nginx.conf

pushd prepare
  ./create-dhparam.sh
popd

podman rmi localhost/nc_web localhost/fpm_web localhost/nc_proxy localhost/fpm_proxy 
# podman-compose -p nc up -d 

popd
