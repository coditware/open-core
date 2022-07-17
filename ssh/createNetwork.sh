#!/bin/bash

docker network create \
    --driver overlay \
    --attachable \
    --subnet=192.168.0.0/24 \
    ssh-server-network
