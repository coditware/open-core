#!/bin/bash
set -e

DIR=$(dirname ${BASH_SOURCE[0]})
source ${DIR}/.variables

docker stack deploy --compose-file ${DIR}/docker-compose.yml ${SERVICE_NAME}
