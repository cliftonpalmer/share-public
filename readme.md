## public

A stupid and easy way to publicize my stuff. like dropbox but safer.

### starting the stack on docker swarm
```
docker stack deploy -c <(docker-compose config) public
```

### reaching the services

Must authorize self through ```$hostname```/lua/publish.lua and set up valid users on first deployment. Right now you gotta ```docker exec -it``` the container to do that.


```
htpasswd -c ${HTTPD_PREFIX}/auth/passwords $username
```
