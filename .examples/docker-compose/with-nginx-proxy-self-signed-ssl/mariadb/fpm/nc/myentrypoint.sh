#!/bin/sh -x
set -eu

ARGS="$@"
if [ -z "$@" ]; then
    ARGS="php-fpm"
fi

NC_ROOT=/var/www/html
# testing
# NC_ROOT=`readlink -f ./tmp`

APPDATA=`ls -d $NC_ROOT/data/appdata_* || true`
if [ -n "$APPDATA" ]; then

    if [ "$(id -u)" = 0 ]; then
        rsync_options="-rlDog --chown www-data:root"
    else
        rsync_options="-rlD"
    fi
    # rsync $rsync_options --delete --exclude-from=/upgrade.exclude /usr/src/nextcloud/ /var/www/html/

    for dir1 in $APPDATA; do
        for dir2 in css js; do
            if [ -d "$dir1/$dir2" ]; then
                rsync $rsync_options --delete \
                "$dir1/$dir2" "$NC_ROOT"
                echo "Updated $dir2 folder"
            fi
        done
    done

fi

/entrypoint.sh "$ARGS"
