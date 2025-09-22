#!/bin/bash
set -e

is_master() {
    curl -s -o /dev/null -w "%{http_code}" http://${POSTGRESQL_HOST}:8008/master
}

if [ "$(is_master)" -eq 200 ]; then
    export PGPASSWORD="$POSTGRESQL_PASSWORD"
    psql --host $POSTGRESQL_HOST --username "$POSTGRESQL_USERNAME" --dbname "postgres" <<-EOSQL
create database keycloak with encoding = 'UTF8';
create role keycloak with password 'keycloak' LOGIN;
grant connect on database keycloak to keycloak;
\connect keycloak
create schema keycloak;
grant create, usage on schema keycloak to keycloak;
EOSQL
fi