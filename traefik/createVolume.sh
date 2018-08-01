#!/bin/bash
set -e
DIR=$(dirname ${BASH_SOURCE[0]})
source ${DIR}/.variables

docker volume create ${VOLUME_NAME:-traefik-data}
