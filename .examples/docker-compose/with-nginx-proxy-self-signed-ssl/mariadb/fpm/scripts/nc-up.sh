#!/bin/bash -x

set -xe

GIT_ROOT=`git rev-parse --show-toplevel`

pushd "$GIT_ROOT/.examples/docker-compose/with-nginx-proxy-self-signed-ssl/mariadb/fpm"

source "scripts/env.sh"

rm web/nginx.conf || true
# HACK for NOT replacing nginx variables
envsubst <web/nginx.in.conf >web/nginx.conf \
  '${SERVER_FQ_DOMAINS} ${SERVER_HTTP_PORT} ${SERVER_HTTPS_PORT} ${DNS_RESOLVER_IP}'


mkdir backup config apps data || true

pushd prepare
  #./create-dhparam.sh
popd

podman rmi localhost/nc_web localhost/fpm_web localhost/nc_proxy localhost/fpm_proxy || true
podman-compose -p nc up # -d 

popd
