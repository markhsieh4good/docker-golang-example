#!/bin/bash

if [ -e gin-layui-admin/conf/app.ini ]; then
  rm gin-layui-admin/conf/app.ini
fi
cp config/app.ini gin-layui-admin/conf/app.ini
sleep 1

sudo docker-compose -f docker-compose.yml up -d
echo "running exec ..."
sleep 2
sudo docker-compose -f docker-compose.yml ps
