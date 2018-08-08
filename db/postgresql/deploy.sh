#!/bin/bash
set -e
DIR=$(dirname ${BASH_SOURCE[0]})
VARIABLES_FILE=${DIR}/.variables

source ${VARIABLES_FILE}

${DIR}/createVolume.sh

docker stack deploy \
    --compose-file ${DIR}/docker-compose.yml \
    ${SERVICE_NAME}
