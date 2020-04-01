#!/bin/bash

# ./killmemory.sh 1024M 30

free -m > /tmp/freee
cat /tmp/freee
mkdir /tmp/memory
mount -t tmpfs -o size=$1 tmpfs /tmp/memory
dd if=/dev/zero of=/tmp/memory/block
free -m > /tmp/freee
cat /tmp/freee
sleep $2
rm -rf /tmp/memory/block
umount /tmp/memory
rmdir /tmp/memory