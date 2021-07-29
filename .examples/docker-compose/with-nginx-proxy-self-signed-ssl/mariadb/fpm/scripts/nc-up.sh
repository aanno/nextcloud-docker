#!/bin/bash -x

set -xe

GIT_ROOT=`git rev-parse --show-toplevel`

pushd "$GIT_ROOT/.examples/docker-compose/with-nginx-proxy-self-signed-ssl/mariadb/fpm"

source "scripts/env.sh"

#rm docker-compose.yml server.conf || true
#envsubst <docker-compose.in.yml >docker-compose.yml

pushd prepare
  ./create-dhparam.sh
popd

podman rmi localhost/nc_web localhost/fpm_web localhost/nc_proxy localhost/fpm_proxy 
podman-compose -p nc up -d 

popd
