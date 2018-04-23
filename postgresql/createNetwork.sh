#!/bin/bash
DIR=$(dirname ${BASH_SOURCE[0]})
VARIABLES_FILE=${DIR}/.variables

if [ ! -f ${VARIABLES_FILE} ]; then
    echo 'FILE NOT FOUND: Missing ${VARIABLES_FILE} file'
    exit 1
fi

source ${VARIABLES_FILE}

docker network create \
    --opt encrypted \
    --driver overlay \
    --attachable ${NETWORK_NAME}
