#!/bin/bash -x

source "scripts/env.sh"

podman-compose -p nc down
podman pod rm ${CONTAINER_FORCE} nc
podman rmi ${CONTAINER_FORCE} localhost/nc_web localhost/nc_app localhost/nc_openssl
