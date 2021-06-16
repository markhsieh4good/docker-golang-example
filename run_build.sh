#!/bin/bash
_FOLDER=$1
_INPUT=$2
echo "input folder ${PWD}/${_FOLDER} ... go build ${_INPUT}"
sudo docker run --rm --name build.golang -v ${PWD}/${_FOLDER}:/opt -w /opt golang:1.15.5-modify go build ${_INPUT}
sleep 1
echo "building finish"
