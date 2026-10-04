#!/bin/sh
set -e
cd "$(dirname "$0")"
mvn -B package
exec java -jar target/redis-in-java.jar "$@"
