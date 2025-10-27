#!/bin/bash
#This script is for local installation only

#export .env vars for this script
if [ -f .env ]; then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

docker-compose down || exit
docker-compose up -d

sleep 10 #Give postgres 10sec to start up before dropping database
docker-compose exec docker_postgres psql -U postgres -c "DROP DATABASE IF EXISTS ${DB_NAME};"
sleep 5 #Give postgres 5sec to drop database before creating a new one
docker-compose exec docker_postgres psql -U postgres -c "CREATE DATABASE ${DB_NAME};"

docker-compose down || exit
docker-compose up -d
