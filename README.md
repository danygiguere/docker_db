# Docker DB

Docker-based local database setups for **MySQL** and **PostgreSQL**.

## Project structure

| Path | Description |
| --- | --- |
| `mysql/` | MySQL container setup with `docker-compose.yml`, `.env.example`, and `my.cnf` |
| `postgres/` | PostgreSQL container setup with `docker-compose.yml` and `.env.example` |

## Quick start

1. Choose the database you want to run.
2. Go into that folder.
3. Copy the example environment file.
4. Start the container with Docker Compose.

```bash
cd mysql
cp .env.example .env
docker compose up -d
```

Or:

```bash
cd postgres
cp .env.example .env
docker compose up -d
```

## Common commands

- Stop the container: `docker compose down`
- Reset with a fresh database: `docker compose down -v && docker compose up -d`

## Database-specific documentation

- MySQL: [`mysql/README.md`](./mysql/README.md)
- PostgreSQL: [`postgres/README.md`](./postgres/README.md)
