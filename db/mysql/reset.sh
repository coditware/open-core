#!/bin/bash
DIR=$(dirname ${BASH_SOURCE[0]})
${DIR}/deleteVolume.sh
${DIR}/createVolume.sh

docker-compose up
