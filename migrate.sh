#! /bin/sh

source .env
echo "Migrating to $DATABASE"

tables=(users units boxes foods shop_plans invitations push_tokens versions)

for table in ${tables[@]}
do
  echo "Insert data into $table"

  cat $BACKUP \
    | sed -n -e "/-- Data for Name: ${table}/,/-- Data/p" \
    | sed s/public.// > ${table}.sql
  mysql \
    -u $MYSQL_USER \
    -p$MYSQL_PASSWORD \
    -h $MYSQL_HOST $MYSQL_DATABASE \
    -e "$(cat ${table}.sql )"
done
