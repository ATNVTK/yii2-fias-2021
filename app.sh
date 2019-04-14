#!/usr/bin/env bash

export ip=$(ip addr show docker0 | grep inet | awk '{print $2}' | head -n 1 | awk -F "/" '{print $1}')
export uid=$(id -u)
export gid=$(id -g)
export XDEBUG_CONFIG="remote_host=$ip"

docker-compose up -d

echo "IP для xdebug: " ${ip}
