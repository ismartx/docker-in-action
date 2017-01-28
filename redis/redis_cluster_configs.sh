echo -e "\e[1;32m[WARNING]This script must run at the current folder of it."

redis_conf="${PWD}/cluster_conf/redis.conf"
redis_conf_output_dir="${PWD}/cluster_conf"
redis_bin="${PWD}/cluster_conf/bin"
redis_ports="6479 6480 6481 6482 6483 6484 6485 6486 6487"

dep_redis(){
    # params: redis_conf_output_dir, redis_ports, redis_bin
    cd $1
    mkdir -p $2
    mkdir -p $3

    start_file="$3/start_redis_all.sh"
    cluster_file="$3/start_redis_cluster.sh"
    touch $start_file && chmod 751 $start_file
    echo "#!/bin/bash" >> $start_file
    touch $cluster_file && chmod 751 $cluster_file
    # local_ip="\`cat /etc/hosts | grep \\\`cat /etc/hostname\\\` | awk '{print \$1}'\`"
    local_ip="10.10.10.10"
    echo -e -n "#!/bin/bash\n" >> $cluster_file
    echo -e "local_ip=$local_ip" >> $cluster_file
    echo -e -n "\n/usr/src/redis/src/redis-trib.rb create --replicas 2 " >> $cluster_file

    # 需要维护一个 config 文件
    ports=$2
    for port in ${ports[@]}
    do
        cp $redis_conf redis-${port}.conf
        # sed -i "s:/data/redis:$1:g;s:6479:$port:g" redis-${port}.conf
        sed -i "s:6479:$port:g" redis-${port}.conf
        echo -e "redis-server redis-${port}.conf \nsleep 1" >> $start_file
        echo -n "\$local_ip:$port " >> $cluster_file
    done
    # To keey redis container running
    echo -e "tail -f redis-6487.conf" >> $start_file
}

dep_redis $redis_conf_output_dir "$redis_ports" $redis_bin
