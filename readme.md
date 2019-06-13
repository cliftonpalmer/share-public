## public

A stupid and easy way to publicize my stuff. like dropbox but safer.

### starting the stack on docker swarm
```
docker stack deploy -c <(docker-compose config) public
```

### creating a public directory by filename regex
```
docker exec -it 581d24de85e5 /root/public simplify
```

## todo

* clean up temporary public directories
    ```
    0 * * * * find /var/www/html/public/* -depth -mtime +7 -delete
    ```
