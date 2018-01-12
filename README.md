# DenyHosts

Runs a lightweight up to date, [DenyHosts](https://github.com/denyhosts/denyhosts) 3.0 instance on the log file you choose (usually `/var/log/secure`) and writes the IP addresses that have been blocked  to `/etc/hosts.deny`.

By default it'll upload IPs you block to the DenyHosts sync server to share with other DenyHosts users, you can turn this off in the `denyhosts.conf` config file.

 You can also download other blocked IPs by enabling `SYNC_DOWNLOAD` in the `denyhosts.conf` config file.

## Usage

### Debian / Ubuntu

```
docker run -d \
	--name denyhosts \
	--restart=always \
	-v /var/log/auth.log:/var/log/auth.log:ro \
	-v /etc/hosts.deny:/etc/hosts.deny \
	heinedej/denyhosts-docker:arm32v7
```

### CentOS

```
docker run -d \
	--name denyhosts \
	--restart=always \
	-v /var/log/secure:/var/log/secure:ro \
	-v /etc/hosts.deny:/etc/hosts.deny \
	heinedej/denyhosts-docker:arm32v7
```



### Using your own config file

Overwrite `denyhosts.conf` with your own settings:

```
docker run -d \
	--name denyhosts \
	--restart=always \
	-v /var/log/secure:/var/log/secure:ro \
	-v /etc/hosts.deny:/etc/hosts.deny \
	-v /your/location/denyhosts.conf:/etc/denyhosts.conf \
	heinedej/denyhosts-docker:arm32v7
```



## docker-compose

There is a example [docker-compose.yml](https://github.com/heinedej/denyhosts-docker/blob/master/docker-compose.yml) file included in the repository to help you get started if you use docker-compose.
