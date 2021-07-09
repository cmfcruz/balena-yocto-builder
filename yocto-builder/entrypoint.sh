#!/bin/bash

# Launch docker
sudo dind dockerd $DOCKER_EXTRA_OPTS > /dev/null 2>&1 &
# sudo dind dockerd $DOCKER_EXTRA_OPTS &
# sudo ln -s /var/run/balena-engine.sock /var/run/docker.sock
# ls /var/run/
while(! sudo docker info > /dev/null 2>&1); do
	sleep 1
done

# git clone --recursive ${YOCTO_REPO} yocto

./balena-yocto-scripts/build/barys -m ${MACHINE} --rm-work -d \
&& cd ./build/tmp/deploy/images/${MACHINE}/ \
&& sudo caddy file-server --browse --listen 0.0.0.0:80
