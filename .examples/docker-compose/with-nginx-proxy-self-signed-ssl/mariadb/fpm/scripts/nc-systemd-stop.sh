#!/bin/bash -x

systemctl --user stop container-nc_web_1.service

systemctl --user stop container-nc_notify_push_1.service

systemctl --user stop container-nc_app_1.service
systemctl --user stop container-nc_cron_1.service

systemctl --user stop container-nc_redis_1.service
systemctl --user stop container-nc_db_1.service
systemctl --user stop pod-nc.service

