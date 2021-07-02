#!/bin/bash

_NAME=$1
_FOLDER=$2
_EXEC=$3
_NETWORK=$4

echo "we create container [${_NAME}] to run exec [${_FOLDER}/${_EXEC}] with network [${_NETWORK}]"
if [ -z ${_NAME} ] || [ -z ${_FOLDER} ] || [ -z ${_EXEC} ]; then
  echo "you lose some argv."
  echo "this.sh Docker_CONTAINER_NAME WHERE_IS_EXEC EXEC_NAME [NETWORK_NAME]"
  echo "... WHERE_IS_EXEC = pwd, mean local current folder"
  exit 1
fi

. init_build.sh

_PATH=${PWD}
if [ ${_FOLDER} == 'pwd' ] || [ ${_FOLDER} == 'PWD' ]; then
  echo ""
else
  _PATH=${PWD}/${_FOLDER}
fi

sudo docker run --restart always -d --name ${_NAME} -v ${_PATH}:/opt -w /opt --network ${_NETWORK} -p 8051:8051 golang:1.15.5-modify ./${_EXEC}
#sudo docker-compose -f docker-compose.yml up -d
echo "running exec ..."
#sudo docker-compose -f docker-compose.yml ps
