#!/bin/bash
# Check if docker-compose is installed
if [ -z $(which docker-compose) ]; then
   echo "docker-compose is not present, please install it. Exit..."
   exit 1
fi
# Create configuration volume
if
   [ -z "$(docker volume ls | grep sconfig)" ]; then
   echo "Create configure volume..."
   docker volume create sconfig
fi
# Create cache volume
if
   [ -z "$(docker volume ls | grep scache)" ]; then
   echo "Create cache volume..."
   docker volume create scache
fi

if [ -z "$1" ] && [ ! -e "docker-compose.yml" ]
   then
   echo "" 
   echo "Please run this script on the same folder with the docker-compose.yml"
   echo "Or provide the location of your docker-compose.yml..."
   echo	"./startsquid.sh /location-of/docker-compose.yml"
   echo ""
   exit 1   
fi
if [ -z "$1" ] && [ -e "docker-compose.yml" ]; then
   docker-compose up -d
else
   docker-compose -f $1 up -d
fi
