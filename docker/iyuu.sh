#!/bin/bash


docker run -d \
--name IYUUAutoReseed \
-e cron='0 9 * * 0' \
-v ~/volumes/iyuu/config.php:/config.php \
--restart=always \
iyuucn/iyuuautoreseed:latest