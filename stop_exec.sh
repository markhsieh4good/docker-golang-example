#!/bin/bash
_INPUT=$1

echo "stop container ${_INPUT}"
if [ -z ${_INPUT} ]; then
  echo "you need teel me what container you need to stop."
  sudo docker ps -a --format '{{.Names}}\t\t{{.Image}}'
  echo "==========="
  exit 1
fi

sudo docker stop ${_INPUT}

sudo docker rm --force ${_INPUT}
