#!/bin/bash

# Commands required to ensure correct docker containers are started when the vm is rebooted.

docker start dynamicdns
docker start sync
docker start sickrage
docker start couchpotato
docker start deluge
