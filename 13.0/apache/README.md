# nextcloud-docker

## Test

Hhm, simple testing is NOT easy. Try the following

In the current dir `nextcloud-docker/13.0/apache`

```bash
mkdir data
sudo chown -R www-data:tape data
```

You have to comment out the 'RedirectMatch' in `000-default.conf`:

* start with `docker-compose up`
* run install stuff with browser on http://localhost:8080
* login to image `docker exec -it 86fc906466c1 bash`
* maybe you have to install an editor: `apt update; apt install nano`
* `cd /etc/apache2/sites-enabled`
* edit the file
* `exit` the container
