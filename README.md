# squid-on-container
Proxy server using squid running on Ubuntu 20.04 docker image
The container was build from Ubuntu 20.04 official image and run on Squid stock configuration file
with 2 modification on setting cache_dir and allow http_access to localnets.  
if you don't want to run this with docker-compose, you can mannualy create volumes for persisent 
configuration and cache folder:

docker volume create sconfig    
docker volume create scache    

then run the container from shell:

docker run -d -v sconfig:/etc/squid -v scache:/var/spool/squid --restart=always --init=true --name pserver trucv/squid:20.04
              
or you can use included startsquid.sh script to start the container with docker-compose.
To modify squid configuration file run this command:

sudo vi $(docker inspect -f {{.Mountpoint}} sconfig)"/squid.conf"

Then reload the configuration without restart the container:

docker exec pserver squid -k reconfigure

Access to container shell run this command:

docker exec -ti pserver bash




