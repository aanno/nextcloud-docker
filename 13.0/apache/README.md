# nextcloud-docker

Attentions: 
While BASE_PATH is supported for nextcloud, the apache2 configuration will pin it to '/nextcloud' at
present. I hope to fix this soon. See below for a work-around.

## Test

I'm providing a the test folder to easily test the container.

```bash
cd test
mkdir data
sudo chown -R www-data:tape data
```

### Editing apache2 configuration while running the container

* start with `docker-compose up`
* run install stuff with browser on http://localhost:8080
* login to image `docker exec -it 86fc906466c1 bash`
* maybe you have to install an editor: `apt update; apt install nano`
* `cd /etc/apache2/sites-enabled`
* edit the file
* `apache2ctl -k graceful` will reload the configuration
  (https://www.cyberciti.biz/faq/apache-2-reload-httpd-config-file-unix-linux-command/)
* `exit` the container
