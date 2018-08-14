#!/bin/bash

openssl req \
    -x509 \
    -nodes \
    -config ./.secrets/openssl.cnf \
    -keyout ./.secrets/test.key \
    -out ./.secrets/test.crt
