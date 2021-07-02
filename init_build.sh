#!/bin/bash

_CHK=`sudo docker images | grep 'golang' | grep '1.15.5-modify' | awk '{printf "%s",$3}'`
echo "check ... [${_CHK}]"

if [ -z ${_CHK} ]; then
  sudo docker build -t golang:1.15.5-modify .
else
  echo "already has image for golang"
fi

_CHK2=`sudo docker images | grep 'nginx' | grep '1.20-alpine-modify' | awk '{printf "%s",$3}'`
echo "check ... [${_CHK2}]"

if [ -z ${_CHK2} ]; then
  sudo docker build -f Dockerfile_Nginx -t nginx:1.20-alpine-modify .
else
  echo "already has image for nginx"
fi
