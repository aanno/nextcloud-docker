#!/bin/bash -x

pushd prepare

  ./create-dhparam.sh

popd

podman rmi localhost/nc_web localhost/fpm_web localhost/nc_proxy localhost/fpm_proxy 
podman-compose -p nc up -d 
