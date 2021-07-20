# Aanno's notes

This is a try to have a out-of-box configuration for podman, based on 
`.examples/docker-compose/with-nginx-proxy-self-signed-ssl/mariadb/fpm`

## `config.php`

The standard `/var/www/html/config/config.php` created is:

```php
<?php
$CONFIG = array (
  'memcache.local' => '\\OC\\Memcache\\APCu',
  'apps_paths' => 
  array (
    0 => 
    array (
      'path' => '/var/www/html/apps',
      'url' => '/apps',
      'writable' => false,
    ),
    1 => 
    array (
      'path' => '/var/www/html/custom_apps',
      'url' => '/custom_apps',
      'writable' => true,
    ),
  ),
  'memcache.distributed' => '\\OC\\Memcache\\Redis',
  'memcache.locking' => '\\OC\\Memcache\\Redis',
  'redis' => 
  array (
    'host' => 'redis',
    'password' => '',
    'port' => 6379,
  ),
  'instanceid' => 'ocaxddcsjccr',
  'passwordsalt' => 'v/rDBw8DwmhClZcyRtI3o+Px70GYWA',
  'secret' => '3WQ7vRo42jtjLNffVhVuUC+0+OOk8AyIpmws9bMOJeapJkOT',
  'trusted_domains' => 
  array (
    0 => 'localhost:8080',
  ),
  'datadirectory' => '/var/www/html/data',
  'dbtype' => 'mysql',
  'version' => '20.0.6.1',
  'overwrite.cli.url' => 'http://localhost:8080',
  'dbname' => 'nextcloud',
  'dbhost' => 'db',
  'dbport' => '',
  'dbtableprefix' => 'oc_',
  'mysql.utf8mb4' => true,
  'dbuser' => 'nextcloud',
  'dbpassword' => 'secret',
  'installed' => true,
);
```

## Misc

* Base URL: https://github.com/nextcloud/docker/issues/167

### Nextcloud notes

* https://github.com/nextcloud/docker standard docker image
* https://github.com/linuxserver/docker-nextcloud (alternative image)
* install
  + https://docs.nextcloud.com/server/20/admin_manual/installation/installation_wizard.html
  + https://docs.nextcloud.com/server/20/admin_manual/installation/command_line_installation.html
* https://docs.nextcloud.com/server/20/admin_manual/maintenance/index.html
* hardening: https://docs.nextcloud.com/server/latest/admin_manual/installation/harden_server.html
* https://docs.nextcloud.com/server/20/admin_manual/configuration_server/config_sample_php_parameters.html
* https://docs.nextcloud.com/server/20/admin_manual/installation/nginx.html
* https://docs.nextcloud.com/server/20/admin_manual/installation/apps_supported.html

#### Data dir

* hardening recommends moving data dir, nextcloud docker image supports with by
  NEXTCLOUD_DATA_DIR variable
* https://plaza.quickbox.io/t/change-default-data-directory-on-nextcloud/7217
* NEXTCLOUD_DATA_DIR seems not to work on nextcloud-docker: 
  https://github.com/nextcloud/docker/issues/1396

### Podman Compose notes

* docker spec: https://docs.docker.com/compose/compose-file/compose-file-v3/
* podman-compose implementations:
  + new redhat implementation (in podman 3.x)
    - https://www.redhat.com/sysadmin/compose-podman-pods
    - https://www.redhat.com/sysadmin/podman-docker-compose
  + standard https://github.com/containers/podman-compose
  + alternative 0 https://github.com/sheeshkebab/podman-compose
  + alternative 1 https://github.com/abalage/pods-compose
  + alternative 2 https://github.com/trusch/stackctl
  + translator: Kompose https://kubernetes.io/docs/tasks/configure-pod-container/translate-compose-kubernetes/
* podman rest API 2.0
  + https://www.redhat.com/sysadmin/podmans-new-rest-api
  + http://crunchtools.com/a-first-look-at-the-podman-2-0-api/
  + https://podman.io/blogs/2020/06/29/podman-v2-announce.html
* enabling podman 
  + https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/building_running_and_managing_containers/using-the-container-tools-api_using-the-container-tools-cli

### Alternative Web Server

* https://geekflare.com/de/open-source-web-servers/
* https://github.com/cbirkenbeul/docker-homelab/
  + Anleitung für diverse docker images und traefik als proxy (let's encrypt funktioniert dann!)

#### Openlitespeed

* https://www.litespeedtech.com/open-source/litespeed-sapi/php
  + https://www.litespeedtech.com/support/wiki/doku.php/litespeed_wiki:php:process-mode#daemon_mode
  + https://docs.litespeedtech.com/cloud/docker/openlitespeed/
  + https://hub.docker.com/r/litespeedtech/openlitespeed
  
## Known (unresolved) problems

* [no svg support in docker image](https://github.com/nextcloud/docker/issues/1414#issuecomment-798781132)
  + https://github.com/nextcloud/docker/tree/master/.examples#imagemagick-svg-support
* [unicode 4-byte-support not working in mariadb 10.6](https://dba.stackexchange.com/questions/256427/unable-to-create-tables-with-row-format-compressed)
  + https://docs.nextcloud.com/server/21/admin_manual/configuration_database/mysql_4byte_support.html

