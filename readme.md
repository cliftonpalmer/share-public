## public

A stupid and easy way to publicize my stuff. like dropbox but safer.

### starting the stack on docker swarm
```
docker stack deploy -c <(docker-compose config) public
```

### reaching the services

Must authorize self through ```$hostname```/lua/publish.lua and set up valid users on first deployment

```
htpasswd -c passwords $username
```

## todo

* clean up temporary public directories
    ```
    0 * * * * find /var/www/html/public/* -depth -mtime +7 -delete
    ```
