#!/bin/bash
export THIS_DIR=$(cd "$(dirname "$0")"; pwd)

export CONTAINER="mysql-local-dev" 

export MYSQL_DATABASE="db"
export MYSQL_ROOT_PASSWORD="randomrootpw1234"
export MYSQL_USER="master"
export MYSQL_PASSWORD="randompw1234" 