#!/bin/bash 


docker run -d --hostname 172.20.99.13 --name rabbitmq -p 15672:15672 -p 5672:5672 \
     --restart=always -e RABBITMQ_DEFAULT_USER=guest -e RABBITMQ_DEFAULT_PASS=guest  \
     rabbitmq:3.8-rc-alpine