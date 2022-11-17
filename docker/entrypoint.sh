#!/bin/bash
set -e

rm -f /recorda-me/tmp/pids/server.pid

exec "$@"