#!/bin/bash

# Check id squid container is running
docker exec -ti pserver ps aux >/dev/null 2>&1
if [ $? != 0 ]; then 
   echo "Squid seem not running or already down, exist..."
   exit 1   
fi
if [ -z "$1" ] && [ ! -e "docker-compose.yml" ]
   then
   echo ""
   echo "Please run this script on the same folder with the docker-compose.yml"
   echo "Or provide the location of your docker-compose.yml..."
   echo "./stopsquid.sh /location-of/docker-compose.yml"
   echo ""
   exit 1
fi
if [ -z "$1" ] && [ -e "docker-compose.yml" ]; then
   docker-compose down
else
   docker-compose -f $1 down
fi

