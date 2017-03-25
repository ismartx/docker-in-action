### Run
```
docker-compose up -d
```

### Init data
#### Run after the docker-compose up
docker exec  docker_mysql mysql -udocker -pDocker_password_1 -Ddocker < init_data.sql
