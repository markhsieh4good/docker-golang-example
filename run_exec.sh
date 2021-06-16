#!/bin/bash

_NAME=$1
_EXEC=$2

echo "we create container [${_NAME}] to run exec [${_EXEC}]"
sudo docker run --restart always -d --name ${_NAME} -v ${PWD}/redshark_fakeapi:/opt -w /opt -p 8051:8051 golang:1.15.5-modify ./${_EXEC}
echo "running exec ..."
