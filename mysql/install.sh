#!/bin/bash
#This script is for local installation only

#export .env vars for this script
if [ -f .env ]; then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

docker-compose down || exit
docker-compose up -d

sleep 10 #Give mysql 10sec to start up before droping database
docker-compose exec db mysql -uroot -p${DB_PASSWORD} -e "DROP DATABASE IF EXISTS ${DB_NAME};"
sleep 10 #Give mysql 10sec to drop database before creating a new one
docker-compose exec db mysql -uroot -p${DB_PASSWORD} -e "CREATE DATABASE ${DB_NAME};"

docker-compose down || exit
docker-compose up -d
