#!/bin/bash -x

podman pod stop nc
podman pod rm nc

podman-compose -p nc down
podman pod rm -f nc
podman pod prune -f

podman volume rm db nextcloud nc_data certs vhost.d html

podman volume prune -f
podman system prune -f
podman image rm -f localhost/nc_web localhost/nc_nextcloud localhost/nc_app
