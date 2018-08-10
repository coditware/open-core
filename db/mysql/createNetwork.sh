#!/bin/bash
set -e
DIR=$(dirname ${BASH_SOURCE[0]})
VARIABLES_FILE=${DIR}/.variables

source ${VARIABLES_FILE}

docker network create \
    --opt encrypted \
    --driver overlay \
    --attachable ${NETWORK_NAME}
