#!/bin/bash

# Commands required to setup working docker environment, link containers etc.
sudo apt-get update

# Stop and remove any existing containers
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

# Run and link the containers
docker run -d -v /vagrant/ddclient/etc:/etc/ddclient --name dynamicdns ryanfox1985/docker-dynamicdns
docker run -d -p 8888:8888 -v /vagrant/ddclient/etc:/etc/ddclient --name sync bittorrent/sync
docker run -d -p 8081:8081 -v /vagrant/sickrage/config:/config -v /vagrant/sickrage/series:/series --name sickrage ryanfox1985/docker-sickrage
docker run -d -p 5050:5050 -v /vagrant/couchpotato/config:/config --name couchpotato ryanfox1985/docker-couchpotato
docker run -d -p 8112:8112 -p 58846:58846 -v /vagrant/deluge/data:/data -v /vagrant/deluge/downloads:/downloads --name deluge aostanin/deluge
