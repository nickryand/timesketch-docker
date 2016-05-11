timesketch-docker
=================

This project contains a Dockerfile, entrypoint script and docker-compose configuration file that will
build out a cluster of containers with the necessary parts to run timesketch.

http://www.timesketch.org/

Requirements
------------

Docker Toolbox ships with everything needed.

https://www.docker.com/products/docker-toolbox


Build
-----
```
$ docker-machine create docker-vm
$ eval $(docker-machine env docker-vm)
$ git clone https://github.com/nickryand/timesketch-docker.git
$ cd timesketch-docker
$ docker-compose up
```

Usage
-----

### Webapp
The Timesketch app should be available at the IP of the `docker-vm`. To get the UP address, echo
the $DOCKER_HOST environment variable.

http://<docker-vm ip>:5000

### Add Users

To add users, you exec the `tsctl` commands inside the timesketch docker container. 
```
$ docker ps
CONTAINER ID        IMAGE                         COMMAND                  CREATED             STATUS              PORTS                    NAMES
7bed6615388f        timesketchdocker_timesketch   "/bin/bash /entrypoin"   58 minutes ago      Up 58 minutes       0.0.0.0:5000->5000/tcp   timesketchdocker_timesketch_1
6d9f223f9099        redis                         "docker-entrypoint.sh"   58 minutes ago      Up 58 minutes       6379/tcp                 timesketchdocker_redis_1
7fc70a9d063e        elasticsearch:1.7.5           "/docker-entrypoint.s"   58 minutes ago      Up 58 minutes       9200/tcp, 9300/tcp       timesketchdocker_elasticsearch_1
$ docker exec timesketchdocker_timesketch_1 tsctl add_user --username testuser --password testpass
User testuser created/updated
$
```
You can use the same pattern to run any of the tsctl commands you may need.

Author
------

Nick Downs <nickryand@gmail.com>

 