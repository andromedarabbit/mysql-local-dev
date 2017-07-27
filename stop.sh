#!/bin/bash
set -eo pipefail

source ./exports.sh

RUNNING=$(docker inspect --format="{{ .State.Running }}" ${CONTAINER} 2> /dev/null || true)
if [ -n "${RUNNING}" ]; then
  docker stop ${CONTAINER} || true
  docker rm ${CONTAINER} || true
fi