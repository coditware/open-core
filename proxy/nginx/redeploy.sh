#!/bin/bash
# set -e
DIR=$(dirname ${BASH_SOURCE[0]})
source ${DIR}/.variables

declare SERVICE_NAME=${SERVICE_NAME:-"nginx-proxy"}
declare IMAGE_NAME=${IMAGE_NAME:-"coditware:nginx-alpine"}
declare VOLUME_NAME=${VOLUME_NAME:-"nginx-data"}

docker image rm ${IMAGE_NAME}
docker build -t ${IMAGE_NAME} ./

docker stack rm ${SERVICE_NAME}

# docker volume rm ${VOLUME_NAME}
# docker volume create ${VOLUME_NAME}

docker stack deploy --compose-file ${DIR}/docker-compose.yml ${SERVICE_NAME}
