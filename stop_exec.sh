#!/bin/bash
_INPUT=$1

echo "stop container ${_INPUT}"
sudo docker stop ${_INPUT}

sudo docker rm --force ${_INPUT}
