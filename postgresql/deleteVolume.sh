#!/bin/bash
DIR=$(dirname ${BASH_SOURCE[0]})
VARIABLES_FILE=${DIR}/.variables

if [ ! -f ${VARIABLES_FILE} ]; then
    echo 'FILE NOT FOUND: Missing ${VARIABLES_FILE} file'
    exit 1
fi

source ${VARIABLES_FILE}

echo 'Attempting to delete "'${VOLUME_NAME}'"'

result=$(docker volume rm ${VOLUME_NAME})

if [ ! -z ${result} ]; then
    echo 'Volume deleted'
else
    echo 'Failed to delete volume'
fi
