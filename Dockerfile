ARG PG_MAJOR=17
FROM postgres:$PG_MAJOR

RUN apt-get update && \
    apt-get install -y postgresql-$PG_MAJOR-pgvector
