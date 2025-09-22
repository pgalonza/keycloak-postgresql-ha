#!/bin/sh

DOCKER_IP=$(hostname --ip-address)
readonly DOCKER_IP

export PATRONI_RESTAPI_CONNECT_ADDRESS="$DOCKER_IP:8008"
export PATRONI_POSTGRESQL_CONNECT_ADDRESS="$DOCKER_IP:5432"

exec /usr/local/bin/patroni /etc/patroni/patroni.yml