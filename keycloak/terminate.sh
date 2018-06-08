#!/bin/bash
set -e

DIR=$(dirname ${BASH_SOURCE[0]})

source ${DIR}/.variables

SERVICE_NAME=${SERVICE_NAME:-keycloak}

docker stack rm ${SERVICE_NAME}
