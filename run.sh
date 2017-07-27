#!/bin/bash
set -eo pipefail

source ./exports.sh

./stop.sh 

docker run --rm -t --name="${CONTAINER}" \
  -v "${PWD}/dumps:/docker-entrypoint-initdb.d" \
  -v "${PWD}/info.js:/usr/src/app/mysqldump-async/info.js" \
  -e MYSQL_DATABASE="${MYSQL_DATABASE}" \
  -e MYSQL_ROOT_PASSWORD="${MYSQL_ROOT_PASSWORD}" \
  -e MYSQL_USER="${MYSQL_USER}" \
  -e MYSQL_PASSWORD="${MYSQL_PASSWORD}" \
  -p 3306:3306 \
  mysql:5.7