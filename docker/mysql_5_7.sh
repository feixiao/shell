#!/bin/bash 

# rpm -ivh https://repo.mysql.com//mysql57-community-release-el7-11.noarch.rpm
# yum search mysql-community
# yum install mysql-community-client.x86_64 -y
# mysql -h 127.0.0.1 -P 3306 -u root -p

docker run --restart=always -itd --name mysql5.7 \
    -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 \
    -e MYSQL_USER=frank -e MYSQL_PASSWORD=123456 \
    -v ~/volumes/mysql:/var/lib/mysql mysql:5.7.33 \
    --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci 

# 修改frank远程登入权限
# 1.查找CONTAINER ID # docker ps
# 2.使用CONTAINER ID进入容器命令 # docker exec -it mysql5.7 /bin/bash
# 3.登录mysql # mysql -u root -p
# 查看MySQL版本号 # select version();
# 4.修改远程连接权限 # alter user 'root'@'%' identified with mysql_native_password by '123456';