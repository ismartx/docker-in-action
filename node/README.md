### run
tar your package to a folder 'app' before start node service
```
tar -xzvf docker.tar.gz
mv docker-fd app
cp deploy.sh app/bin
```

modify app/bin/deploy.sh with prod settings [env, site]
modify app/server/src/conf/conf.$env.js with officialApi setting [example: conf.dev.js at the folder]
