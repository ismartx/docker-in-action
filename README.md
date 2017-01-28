### docker in action
#### docker images
- [java:8-jdk](https://hub.docker.com/_/java/)
- [mysql:5.7](https://hub.docker.com/_/mysql/)
- [redis](./redis/Dockerfile)
- [node](./node/Dockerfile)
- [elasticsearch:2.4.3](https://hub.docker.com/_/elasticsearch/)

#### run(at docker-compose.xml path to run docker-compose command)
```
docker-compose up
```
#### restart service
```
docker-compose restart docker_redis
docker-compose restart docker_java
docker-compose restart docker_node
docker-compose restart docker_es
docker-compose restart docker_mysql
```
