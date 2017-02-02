[English docs](./README.md)

### docker实践
这是一个Java(spring boot)的docker项目，使用了mysql, redis, nodejs, elasticsearch组件。
#### 组件
- [java:8-jdk](https://hub.docker.com/_/java/)
- [mysql:5.7](https://hub.docker.com/_/mysql/)
- [redis](./redis/Dockerfile)
- [node](./node/Dockerfile)
- [elasticsearch:2.4.3](https://hub.docker.com/_/elasticsearch/)

参考组件文件夹中的README和docker-compose.yml文件可以获得更多组件信息。

#### 运行项目
```
docker-compose up -d
```
#### 重启服务
```
docker-compose restart docker_redis
docker-compose restart docker_java
docker-compose restart docker_node
docker-compose restart docker_es
docker-compose restart docker_mysql
```
