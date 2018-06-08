#!/bin/bash
set -e
DIR=$(dirname ${BASH_SOURCE[0]})

docker stack deploy --compose-file ${DIR}/docker-compose.yml ${SERVICE_NAME:-"gitlab-runner"}
