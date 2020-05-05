#!/bin/sh
#download data from master container 
docker-compose exec --user root server /bin/sh -c 'docker exec -it --user root $(docker ps -q --filter ancestor=hosts/'"$1"') '"$2"''
