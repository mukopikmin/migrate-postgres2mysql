#! /bin/sh

source .env
echo "Clear rows in $MYSQL_DATABASE"

tables=(versions push_tokens invitations shop_plans foods boxes units users)

for table in ${tables[@]}
do
  mysql \
    -u $MYSQL_USER \
    -p$MYSQL_PASSWORD \
    -h $MYSQL_HOST $MYSQL_DATABASE \
    -e "DELETE FROM ${table};" 
done

