### docker in action
Docker in action a Java(spring boot) docker project with mysql, redis, nodejs, elasticsearch components.
#### components
- [java:8-jdk](https://hub.docker.com/_/java/)
- [mysql:5.7](https://hub.docker.com/_/mysql/)
- [redis](./redis/Dockerfile)
- [node](./node/Dockerfile)
- [elasticsearch:2.4.3](https://hub.docker.com/_/elasticsearch/)

Reference to README and docker-compose.yml in each component folder.

#### run project
```
docker-compose up -d
```
#### restart service
```
docker-compose restart docker_redis
docker-compose restart docker_java
docker-compose restart docker_node
docker-compose restart docker_es
docker-compose restart docker_mysql
```
