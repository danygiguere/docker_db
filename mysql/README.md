# MySQL Docker DB

### Local Installation

1. Make sure you have Docker installed on your computer.
2. Run `cp .env.example .env` and add your credentials and specifications.
3. Make sure Docker is up and run: `docker compose up -d`

### Commands

- Stop the container: `docker compose down`
- Reset with a fresh database: `docker compose down -v && docker compose up -d`

### Connecting from another Docker project

Add the network name to your project's `docker-compose.yml`. You can find it by running `docker network ls` but it should be `docker_db_mynetwork`.

```yaml
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