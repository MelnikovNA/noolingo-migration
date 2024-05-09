ARG SERVICE=migration-service

FROM alpine:3.16.2
ENV MIGRATE_VER=v4.15.2
ARG MIGRATE_VER

RUN apk add --update make curl

WORKDIR /app/
COPY migrations/ ./migrations
COPY Makefile .

RUN mkdir -p .bin
RUN curl -s -L https://github.com/golang-migrate/migrate/releases/download/$MIGRATE_VER/migrate.linux-amd64.tar.gz | tar -C .bin -vxz migrate

RUN adduser -D app && mkdir -p /app && chown -R app /app
USER app

ENTRYPOINT  make all-docker
#ENTRYPOINT sleep infinity 
