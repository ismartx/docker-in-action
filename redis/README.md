### run
> only run below shell one time before run docker compose

clear the cluster_conf exclude redis.conf
```
rm -f ./cluster_conf/64*/*
```

run redis_cluster_configs to generate cluster configurations
```
chmod +x ./redis_cluster_configs.sh
sh ./redis_cluster_configs.sh
```

after the container started, start redis cluster
```
docker exec -it docker_redis /bin/bash ./bin/start_redis_cluster.sh
```
and restart the services which links to docker_redis, eg.
```
docker-compose restart docker_java
```
