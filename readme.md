## public

A stupid and easy way to publicize my stuff. like dropbox but safer.

### starting the stack on docker swarm
```
docker stack deploy -c <(docker-compose config) public
```

### creating a public directory by filename regex
```
cliftonpalmer@pop-os:~/swarm/share-public$ ./public.sh  simplify
http://public.purplebirdman.online/1ojxVHOXk9u89u234erso7df/SimplifyPikoPseftis3.jpg
http://public.purplebirdman.online/1ojxVHOXk9u89u234erso7df/SimplifyPikoPseftis.png
http://public.purplebirdman.online/1ojxVHOXk9u89u234erso7df/SimplifyPikoPseftis.clip
http://public.purplebirdman.online/1ojxVHOXk9u89u234erso7df/SimplifyPikoPseftis2.png
```

### listing public directories and contents
```
cliftonpalmer@pop-os:~/swarm/share-public$ ./public.sh
http://public.purplebirdman.online/1ojxVHOXk9u89u234erso7df/SimplifyPikoPseftis3.jpg
http://public.purplebirdman.online/1ojxVHOXk9u89u234erso7df/SimplifyPikoPseftis2.png
http://public.purplebirdman.online/1ojxVHOXk9u89u234erso7df/SimplifyPikoPseftis.png
http://public.purplebirdman.online/1ojxVHOXk9u89u234erso7df/SimplifyPikoPseftis.clip
```

## todo

* clean up temporary public directories
    ```
    0 * * * * find /var/www/html/public/* -depth -mtime +7 -delete
    ```
