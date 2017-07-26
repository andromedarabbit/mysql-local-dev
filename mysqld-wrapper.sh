#!/bin/bash
set -e

pid=0

# SIGUSR1-handler
save_handler() {
  cd /usr/src/app/mysqldump-async/
  ./dump.js.command || true

  # wait indefinitely
  while true
  do
    tail -f /dev/null & wait ${!}
  done
}

# SIGTERM-handler
term_handler() {
  cd /usr/src/app/mysqldump-async/
  ./dump.js.command

  if [ $pid -ne 0 ]; then
    kill -SIGTERM "$pid"
    wait "$pid"
  fi
  exit 143; # 128 + 15 -- SIGTERM
}

# setup handlers
# on callback, kill the last background process, which is `tail -f /dev/null` and execute the specified handler
trap 'save_handler' SIGUSR1
trap 'kill ${!}; term_handler' SIGTERM

# run application
mysqld &
pid="$!"

# wait indefinitely
while true
do
  tail -f /dev/null & wait ${!}
done