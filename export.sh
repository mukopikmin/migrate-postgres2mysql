#! /bin/sh

source .env

echo "Export to $BACKUP"

pg_dump \
  -h $POSTGRES_HOST \
  -U $POSTGRES_USER \
  --inserts \
  $POSTGRES_DATABASE \
  > $BACKUP
  