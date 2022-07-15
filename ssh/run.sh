#!/bin/bash
DIR=$(cd -- $(dirname "${BASH_SOURCE[0]}") &> /dev/null && pwd)

${DIR}/build.sh
docker run --name ssh-server --rm -it -p 22:22 ssh-server:latest $@
