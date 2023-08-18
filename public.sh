#!/bin/bash
service=proxy_public

for f in $(docker service ps -q $service)
do
    [[ running == $(docker inspect --format '{{.Status.State}}' $f) ]] || continue
    container_id=$(docker inspect --format '{{.Status.ContainerStatus.ContainerID}}' $f)
    echo docker exec $container_id /root/public "$@"
    docker exec $container_id /root/public "$@"
done
