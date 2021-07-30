# Nextcloud example

Before everything else, `mv db.env.template db.env` and adapt it to your needs!
Also `mv scripts/env.sh.template scripts/env.sh` and adapt it to your needs!

## Test setup

### notify_push with test setup (not working)

* You are (probably) using a dummy cert
* Map the fqn(s) of your server to your ip in `/etc/hosts`:
  ```
  # testing nextcloud 
  192.168.10.20 breitbandig breitbandig.local
  192.168.10.20 www.breitbandig.local
  192.168.10.20 signaling.breitbandig.local
  192.168.10.20 netzgeneration netzgeneration.local
  192.168.10.20 www.netzgeneration.local
  192.168.10.20 signaling.netzgeneration.local
  ```
* Edit `config/config.php` to include the name(s) in the array of `trusted_domains`:
  ```php
    'trusted_domains' => 
  array (
    0 => 'localhost:8443',
    1 => 'breitbandig:8443',
    2 => 'breitbandig.local:8443',
    3 => 'www.breitbandig.local:8443',
    4 => 'signaling.breitbandig.local:8443',
    5 => 'netzgeneration:8443',
    6 => 'netzgeneration.local:8443',
    7 => 'www.netzgeneration.local:8443',
    8 => 'signaling.netzgeneration.local:8443',
  ),
  ```
* Install the app 'Client Push' and enable it
* `./scripts/occ.sh notify_push:setup https://breitbandig.local:8443/nextcloud/push` should run but errors
* Use `wget --no-check-certificate https://localhost:8443/nextcloud/index.php/apps/notify_push/test/version` for testing
* You could try https://breitbandig.local:8443/nextcloud/push/test/cookie as well

## Known issues

* [extreme slowdown](https://github.com/nextcloud/richdocuments/issues/1282) <br/>
  hence I disabled:
  + spreed (aka talk)
  + richdocuments
  + richdocumentscode
* [svg images](https://github.com/nextcloud/docker/issues/14)

## TODOs

* [server to client push](https://github.com/nextcloud/notify_push) DONE!
* [certbot](https://certbot.eff.org/docs/using.html) (not integraded, incomplete)
  + https://certbot.eff.org/docs/install.html#running-with-docker
  + https://certbot.eff.org/docs/ciphers.html#weakdh-logjam
* nginx not starting
  + https://sandro-keil.de/blog/let-nginx-start-if-upstream-host-is-unavailable-or-down/
  + https://stackoverflow.com/questions/32845674/setup-nginx-not-to-crash-if-host-in-upstream-is-not-found
* podman DNS
  + https://github.com/containers/podman/issues/3277
* up-to-date podman-compose
  + https://github.com/containers/podman-compose
  + https://github.com/containers/podman-compose/issues/283 (--podman-run-args)
* kube/pod file instead of podman-compose/docker-compose
  + https://www.redhat.com/sysadmin/compose-podman-pods

## DB backup and restore

* [backup](https://docs.nextcloud.com/server/latest/admin_manual/maintenance/backup.html)
* [restore](https://docs.nextcloud.com/server/latest/admin_manual/maintenance/restore.html)

## Tips and tricks

* [force data rescan](https://help.nextcloud.com/t/solved-resync-after-hdd-replace-on-server/2882/4) <br/>
  `occ files:scan --all`

## Apps/Plugins

* [talk (spreed)](https://github.com/nextcloud/spreed)

### full text search

* https://github.com/nextcloud/fulltextsearch/wiki/Basic-Installation
* https://decatec.de/home-server/volltextsuche-in-nextcloud-mit-ocr/
* https://www.c-rieger.de/volltextsuche-mit-nextcloud-20-elasticsearch-und-tessaract/

## IAM/SSO/Federation

* [Social Login](https://apps.nextcloud.com/apps/sociallogin)
  + https://github.com/zorn-v/nextcloud-social-login
* [OIDC Login](https://apps.nextcloud.com/apps/oidc_login)
  + https://github.com/pulsejet/nextcloud-oidc-login
* [User OIDC Backend](https://apps.nextcloud.com/apps/user_oidc)
  + https://github.com/nextcloud/user_oidc
* [SAML Authentication](https://apps.nextcloud.com/apps/user_saml)
  + https://github.com/nextcloud/user_saml
* [Nextcloud as OIDC provider for OAuth2 clients](https://docs.nextcloud.com/server/latest/admin_manual/configuration_server/oauth2.html)
