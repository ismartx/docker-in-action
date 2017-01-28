#!/bin/bash
projPath=$(cd "$(dirname $BASH_SOURCE)" || exit; cd .. || exit; pwd)

# 输入部署环境
# echo "Please enter your deploy environment (dev/test/prod):"
# read -r env
env="test"

# 输入部署分支
# echo "Please enter your branch:"
# read -r branch
# if [[ -z $branch ]];then
  # echo "Branch error"
  # exit -1
# fi

# 输入部署 site
# echo "Please enter your site (Site names separated by commas, if you want to deploy all, enter 'all'):"
# read -r sites
sites="all"

# #检查前端仓库是否存在
# cd "$basePath" || exit
# if [[ -d mmb-frontend ]];then
#     cd mmb-frontend || exit
#     git checkout -f
# else
#     git clone git@git.dingdingyisheng.mobi:mmb-frontend/mmb-frontend.git
# fi

# 切换分支
# cd "$projPath" || exit
# git checkout "$branch"
# git fetch origin
# git pull origin "$branch"
# git merge --no-ff origin/master

# 部署 site
paths=$(ls -ld "$projPath"/site/* | grep ^d | awk '{print $NF}')

for path in $paths; do
  s=${path##*/}
  if [[ $sites = "$s" || $sites = "all" ]];then
    cd "$path" || exit
    npm install
    npm run build:"${env}"
    echo "site $(basename "$path") released"
  else
    echo "site $(basename "$path") not released"
  fi
done

# 启动 server
cd "$projPath"/server || exit
# nvm use # 切换 node 版本
npm install
npm run build # 编译

is_running=$(ps aux | grep "$projPath"/server/dist/startup.js | grep -cv grep)

if [[ $is_running -gt 0 ]]
then
  pm2 reload pm2.json --env "${env}"
else
  pm2 start pm2.json --env "${env}"
fi

pm2 logs
