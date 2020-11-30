docker run --restart=always -itd --name mysql5.7 \
    -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 \
    -e MYSQL_USER=frank -e MYSQL_PASSWORD=123456 \
    -v ~/volumes/mysql:/var/lib/mysql mysql:5.7 \
    --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci