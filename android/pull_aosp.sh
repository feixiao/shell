#!/usr/bin/env bash
 
export LOG_ACCOUNT=tmp
export LOG_FILENAME=repo-sync
export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo'
 
aosp_branch=android-11.0.0_r1
 
if [ ! -d ".repo" ]; then
    repo init -u https://mirrors.tuna.tsinghua.edu.cn/git/AOSP/platform/manifest -b $aosp_branch
    repo_stat=$?
    if [ $repo_stat -ne 0 ]; then
        log -o -- "init repo faild, please try again"
        exit 0
    fi
else
    log -o -- "local .repo dir exists"
fi
 
try_count=0
log -o -- "from remote sync aosp"
 
repo sync
repo_stat=$?
while [ $repo_stat -ne 0 ]; do
    log -o -- "sync faild, status: $repo_stat, try again in 5s ..."
    sleep 5
    repo sync
    repo_stat=$?
    ((try_count++))
done
 
log -o -- "sync repo over, try_count: $try_count"
log -o -unotify "sync over, success"
 

