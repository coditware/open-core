#!/bin/bash
set -e
DIR=$(dirname ${BASH_SOURCE[0]})
source ${DIR}/.variables

docker network create --driver overlay --attachable ${NETWORK_NAME:-"nginx-proxy"}
