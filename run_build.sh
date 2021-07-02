#!/bin/bash
_FOLDER=$1
_INPUT=$2
echo "input folder ${PWD}/${_FOLDER} ... go build ${_INPUT}"
if [ -z ${_FOLDER} ] || [ -z ${_INPUT} ]; then
  echo "you lose some argv."
  echo "this.sh FOLDER_NAME GOLANG_FILE"
  echo "... FOLDER_NAME = pwd, mean local current folder"
  exit 1
fi

. init_build.sh

_PATH=${PWD}
_EXEC=`echo ${_INPUT} | sed 's/.go//g'`
if [ ${_FOLDER} == 'pwd' ] || [ ${_FOLDER} == 'PWD' ]; then
  echo ""
else
  _PATH=${PWD}/${_FOLDER}
fi

sudo rm ${PWD}/${_FOLDER}/${_EXEC}
sudo docker run --rm --name build.golang -v ${_PATH}:/opt -w /opt golang:1.15.5-modify go build ${_INPUT} -o ${_EXEC}
sleep 1
echo "building finish"
