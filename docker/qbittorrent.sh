#!/bin/bash 

# https://blog.csdn.net/maxuearn/article/details/104562021

# 默认用户名密码admin/adminadmin

docker run -d \
  --name=qbittorrent \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Shanghai \
  -e WEBUI_PORT=8081 \
  -p 6881:6881 \
  -p 6881:6881/udp \
  -p 8081:8081 \
  -v ~/volumes/qb/qb/config:/config \
  -v ~/rrstore/qb_download:/downloads \
  --restart=always \
  linuxserver/qbittorrent:14.3.3.99202101191832-7248-da0b276d5ubuntu18.04.1-ls114