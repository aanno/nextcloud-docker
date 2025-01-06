#!/bin/bash -x
# https://docs.nextcloud.com/server/latest/admin_manual/maintenance/backup.html
source db.env
podman exec -it nc_db_1 mysqldump --single-transaction --default-character-set=utf8mb4 \
  -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} \
  > backup/nextcloud-sqlbkp_`date +"%Y%m%d"`.bak
