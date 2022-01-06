#!/bin/bash -x

set -x

GIT_ROOT=`git rev-parse --show-toplevel`

pushd "$GIT_ROOT/.examples/docker-compose/with-nginx-proxy-self-signed-ssl/mariadb/fpm"

source "scripts/env.sh"

rm web/nginx.conf web/snippets/le-certbot.conf || true
# HACK for NOT replacing nginx variables
envsubst <web/nginx.in.conf >web/nginx.conf \
  '${SERVER_EXTERNAL_IP} ${SERVER_FQ_DOMAINS} ${SERVER_HTTP_PORT} ${SERVER_HTTPS_PORT} ${DNS_RESOLVER_IP}'

envsubst <web/snippets/le-certbot.in.conf >web/snippets/le-certbot.conf

mkdir -p backup config apps data "${SERVER_HTTPS_CERT_VOLUME}/live/${CERTBOT_PRIMARY_DOMAIN}" || true

pushd prepare
  ./create-dhparam.sh
popd

podman rmi localhost/nc_web localhost/fpm_web localhost/nc_proxy localhost/fpm_proxy || true
# old way to use the private network 'proxy-tier'
# problem: no pod created
# podman-compose -p nc -t identity --podman-run-args='--net proxy-tier' up -d

# problem: create pod but network 'proxy-tier' is NOT used, /etc/hosts is modified to contain all other container
# (i.e. no addition of containers possible)
# podman-compose -p nc up -d

podman pod rm -f nc || true
podman pod create -n nc
# podman 1.0.2 changes this (tp)
# podman-compose -t identity --podman-run-args='--pod nc --net proxy-tier' -p nc up -d
podman-compose -p nc up -d

popd
