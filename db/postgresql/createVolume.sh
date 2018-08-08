#!/bin/bash
DIR=$(dirname ${BASH_SOURCE[0]})
VARIABLES_FILE=${DIR}/.variables

if [ ! -f ${VARIABLES_FILE} ]; then
    echo 'FILE NOT FOUND: Missing ${VARIABLES_FILE} file'
    exit 1
fi

source ${VARIABLES_FILE}

echo 'Attempting to create volume "'${VOLUME_NAME}'"'

result=$(docker volume create \
    --label vendor=${VENDOR} \
    --label contact=${CONTACT} \
    --label description="${DESCRIPTION}" \
    ${VOLUME_NAME})

if [ ! -z ${result} ]; then
    echo 'Volume created'
    exit 0
else
    echo 'Failed to create volume'
    exit 1
fi
