#!/bin/sh

docker-compose down
docker-compose up -d --build

LABGUI_PORT=2222 ./gui.sh


