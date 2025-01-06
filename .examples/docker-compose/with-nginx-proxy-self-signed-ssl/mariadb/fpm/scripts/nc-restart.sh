#!/bin/bash -x

if [ `whoami` != 'tpasch' ]; then
        echo "user is not tpasch"
        exit -1
fi

BASE="$HOME/nextcloud"

cd
cd nextcloud
$BASE/scripts/nc-pull.sh
$BASE/scripts/nc-down.sh
$BASE/scripts/nc-up.sh
