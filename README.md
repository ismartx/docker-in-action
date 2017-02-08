[中文文档](./README.zh-cn.md)

### docker in action
Docker in action is a Java(normally spring boot) docker project with mysql, redis, nodejs, elasticsearch components.
#### components
- [java:8-jdk](https://hub.docker.com/_/java/)
- [mysql:5.7](https://hub.docker.com/_/mysql/)
- [redis](./redis/Dockerfile)
- [node](./node/Dockerfile)
- [elasticsearch:2.4.3](https://hub.docker.com/_/elasticsearch/)

Reference to README and docker-compose.yml(component unit testing) in each component folder for more components details.

#### run project
```
docker-compose up -d
```

#### stop project
```
docker-compose stop
```

#### restart service
```
docker-compose restart docker_redis
docker-compose restart docker_java
docker-compose restart docker_node
docker-compose restart docker_es
docker-compose restart docker_mysql
```
