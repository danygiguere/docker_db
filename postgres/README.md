# README #

### Local Installation
- First, make sure you have Docker installed on your computer.
- second, run `cp .env.example .env` and add your credentials and specifications
- Then make sure Docker is up and run this command: `sh install.sh`

- to stop the db docker image, run: `docker-compose down`
- to restart it without rebuilding, run: `docker-compose up`

Then in your other projects, you must add the network name to your docker-compose file. You can find it by running `docker network ls` but it should be `docker_db_mynetwork`. For example for a spring boot project, you should have:


```
version: ...

services:
  app ...

networks:
  default:
    external:
      name: docker_db_mynetwork
```