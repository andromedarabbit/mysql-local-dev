#!/bin/bash
set -eo pipefail

source ./exports.sh

docker run -t --link ${CONTAINER} \
    -v "${THIS_DIR}/info.js:/usr/src/app/info.js" \
    -v "${THIS_DIR}/dumps/:/usr/src/app/dumps/" \
    -e MYSQL_HOSTNAME="${CONTAINER}" \
    -e MYSQL_DATABASE="${MYSQL_DATABASE}" \
    -e MYSQL_ROOT_PASSWORD="${MYSQL_ROOT_PASSWORD}" \
    -e MYSQL_USER="${MYSQL_USER}" \
    -e MYSQL_PASSWORD="${MYSQL_PASSWORD}" \
    andromedarabbit/mysqldump-async:1.0.3
