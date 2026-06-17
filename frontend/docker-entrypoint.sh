#!/bin/sh
set -e

: "${BACKEND_HOST:=back-task-service}"
: "${BACKEND_PORT:=3001}"

if [ -f /etc/nginx/conf.d/default.conf.template ]; then
  envsubst '$BACKEND_HOST $BACKEND_PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
fi

exec nginx -g 'daemon off;'
