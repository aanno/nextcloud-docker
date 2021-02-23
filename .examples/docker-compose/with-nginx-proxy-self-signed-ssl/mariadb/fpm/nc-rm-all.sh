#!/bin/bash

podman pod stop nc
podman pod rm nc

podman-compose -p nc down
podman pod rm -f nc
podman pod prune -f
podman volume prune -f
podman system prune -f
podman image rm -f localhost/nc_web localhost/nc_nextcloud
