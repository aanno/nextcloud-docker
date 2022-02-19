#!/bin/bash -x

systemctl --user start pod-nc.service
systemctl --user start container-nc_redis_1.service
systemctl --user start container-nc_db_1.service
sleep 5
systemctl --user start container-nc_app_1.service
systemctl --user start container-nc_cron_1.service
sleep 5
systemctl --user start container-nc_notify_push_1.service
sleep 1
systemctl --user start container-nc_web_1.service
