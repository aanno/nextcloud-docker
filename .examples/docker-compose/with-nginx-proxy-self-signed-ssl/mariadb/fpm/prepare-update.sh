#!/bin/bash -x

podman pod rm -f nc
podman rmi localhost/nc_web localhost/nc_app localhost/nc_openssl
