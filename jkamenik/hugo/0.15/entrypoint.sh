#!/usr/bin/env sh

HUGO=/usr/bin/hugo

cd /src

# Arguments were passed.  Just run them.
if [ -n "$1" ]; then
  echo "- Using args as entry point: '$@'"
  exec "$@"
  exit $?
fi

echo "==== HUGO ===="
hugo $HUGO_ARGS
