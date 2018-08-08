#!/bin/bash
set -e
DIR=$(dirname ${BASH_SOURCE[0]})
source ${DIR}/.variables

docker stack rm ${SERVICE_NAME:-gitlab}
