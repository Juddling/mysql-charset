#!/usr/bin/env bash

HOST="localhost"
USER="root"
DATABASE=""
CHARSET="utf8mb4"
COLLATION="utf8mb4_unicode_ci"

tables() {
  local query="SELECT CONCAT(TABLE_SCHEMA, '.', TABLE_NAME) AS \`table\` \
    FROM INFORMATION_SCHEMA.TABLES \
    WHERE TABLE_SCHEMA=\"${DATABASE}\" AND TABLE_TYPE=\"BASE TABLE\""
  mysql -h ${HOST} -u ${USER} -p ${DATABASE} -e "${query}"
}

generate_sql() {
  # disable FK checks while we are converting
  echo "SET foreign_key_checks = 0;";

  tables | while read -r table; do
    echo "ALTER TABLE ${table} CONVERT TO CHARACTER SET ${CHARSET} COLLATE ${COLLATION};"
  done

  echo "SET foreign_key_checks = 1;";
}

generate_sql
