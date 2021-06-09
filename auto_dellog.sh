#!/bin/bash

# 使用说明
# 根据自己需要监控的目录修改/dev/sdb4, df -h 可以看到
# 根据自己的需求需要百分比这里使用了95

while [ 1 > 0 ]
do
    #free_disk_percent=`df -h | grep "/dev/sdb4 " | awk '{print $5}'| awk -F"%" '{print $1}'`
	free_disk_percent=`df -h | grep -w "/home" | awk '{print $4}'|awk -F"%" '{print $1}'`
    echo $free_disk_percent
    if [ $free_disk_percent -ge 95 ];then
        will_dellog_files=`ls -lrt /data/relaysvr/log/relaysvr.log.*|head -n 40 | awk '{print $9}'`
        for del_log in $will_dellog_files
        do
         rm -f $del_log
        done
else
   echo "fdisk is enough"
   sleep 5
fi
done
