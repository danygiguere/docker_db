# README #

### Local Installation
- First, make sure you have Docker installed on your computer.
- second, run `cp .env.example .env` and add your credentials and specifications
- Then make sure Docker is up and run this command: `sh install.sh`

- to stop the db docker image, run: `docker-compose down`
- to restart it without rebuilding, run: `docker-compose up`

Then in your other projects, you must add the network name to your docker-compose file. You can find it by running `docker network ls` but it should be `docker_db_mynetwork`. For example for a spring boot project, you should have:


```
version: '3.7'

services:
  app:
    container_name: app
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "8080:8080"
    environment:
      - spring.datasource.url=jdbc:mysql://docker_db:3306/docker_db?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8&allowMultiQueries=true&useSSL=false
    restart: unless-stopped

networks:
  default:
    external:
      name: docker_db_mynetwork
```