#!/bin/sh
#download data from master container 
docker exec --user root $(docker-compose ps -q server) rm -r /tmp/store_input 
docker exec --user root $(docker-compose ps -q server) /bin/sh -c 'docker cp $(docker ps -q --filter ancestor=hosts/master):/scanner/distribution/catss/maus/store_input /tmp/'
mkdir ../maus/store_input
docker cp $(docker-compose ps -q server):/tmp/store_input/network.json ./network.json
docker cp $(docker-compose ps -q server):/tmp/store_input/scan.xml ./scan.xml
