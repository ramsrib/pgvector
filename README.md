# README

[This](https://hub.docker.com/r/ramsrib/pgvector) docker image extends the official [PostgreSQL](https://hub.docker.com/_/postgres) image with the [PgVector](https://github.com/pgvector/pgvector) extension.

Supported version of postgres: 12, 13, 14, 15, 16

## Installation

### For Postgres 16

```bash
docker run -d --name pgvector-16 -p 5432:5432 -e POSTGRES_PASSWORD=postgres ramsrib/pgvector:16

# enable the pgvector extension
docker exec -it pgvector-16 psql -U postgres -c "CREATE EXTENSION vector"

# verify the version
docker exec -it pgvector-16 psql -U postgres -c "SELECT extversion FROM pg_extension WHERE extname = 'vector';"
```

#### Example commands

```bash
docker exec -it pgvector-16 psql -U postgres

CREATE TABLE items (id bigserial PRIMARY KEY, embedding vector(3));
INSERT INTO items (embedding) VALUES ('[1,2,3]'), ('[4,5,6]');
SELECT * FROM items ORDER BY embedding <-> '[3,1,2]' LIMIT 5;
```

### For Postgres 15

```bash
docker run -d --name pgvector-15 -p 5432:5432 -e POSTGRES_PASSWORD=postgres ramsrib/pgvector:15
```

### For Postgres 14

```bash
docker run -d --name pgvector-14 -p 5432:5432 -e POSTGRES_PASSWORD=postgres ramsrib/pgvector:14
```

### For Postgres 13

```bash
docker run -d --name pgvector-13 -p 5432:5432 -e POSTGRES_PASSWORD=postgres ramsrib/pgvector:13
```

### For Postgres 12

```bash
docker run -d --name pgvector-12 -p 5432:5432 -e POSTGRES_PASSWORD=postgres ramsrib/pgvector:12
```

### References

- [PostgreSQL](https://www.postgresql.org/)
- [PgVector](https://github.com/pgvector/pgvector)
- [Docker Hub](https://hub.docker.com/r/ramsrib/pgvector)
