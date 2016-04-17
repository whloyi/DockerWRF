#!/bin/bash

yum update -y
yum install -y btrfs-progs docker ecs-init nfs-utils
mount -o defaults,noatime /dev/sdb /mnt
btrfs filesystem resize max /mnt
usermod -a -G docker ec2-user
service docker start
start ecs
service nfs start
exportfs *:/mnt
docker pull mjs472/wrf-base:0.0.1
