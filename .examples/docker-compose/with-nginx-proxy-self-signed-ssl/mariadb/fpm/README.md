# Nextcloud example

## Known issues

* [extreme slowdown](https://github.com/nextcloud/richdocuments/issues/1282) <br/>
  hence I disabled:
  + spreed (aka talk)
  + richdocuments
  + richdocumentscode

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
