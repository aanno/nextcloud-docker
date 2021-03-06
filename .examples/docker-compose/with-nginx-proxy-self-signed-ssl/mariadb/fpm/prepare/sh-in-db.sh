#!/bin/bash -x

# dump
# https://mariadb.com/kb/en/mysqldump/
#
# dump examples
###############
# mysqldump --user=root --host=localhost --protocol=tcp --port=40177 \
#   --default-character-set=utf8 --routines --single-transaction=TRUE \
#   --databases "gitbucket" "cloud" "keycloak"
#
# Flags:
# --all-databases
#
# restore
#########
# https://docs.bitnami.com/aws/infrastructure/mariadb/administration/backup-restore-mysql-mariadb/
# https://mariadb.com/kb/en/restoring-data-from-dump-files/
# https://dev.to/nabbisen/mariadb-backing-uprestoring-databases-on-the-command-line-351j
#
# restore examples
##################
# mysql -u root -p < backup.sql
# mysql -u root -p -D bitnami_app < backup.sql
#
# alternatives
##############
# https://mariadb.com/kb/en/backup-and-restore-overview/
# https://mariadb.com/kb/en/mysqlimport/
# https://mariadb.com/kb/en/mariabackup-overview/


podman \
  run \
  --rm --env-file=../db.env \
  --entrypoint=bash \
  -it \
  --volume db:/var/lib/mysql --volume ./dumps:/dumps:ro \
  mariadb
