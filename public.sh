#!/bin/bash
service=public_web

for f in $(docker service ps -q $service)
do
    container_id=$(docker inspect --format '{{.Status.ContainerStatus.ContainerID}}' $f)
    docker exec $container_id /root/public "$@"
done
