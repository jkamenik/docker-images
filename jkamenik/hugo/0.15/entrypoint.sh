#!/usr/bin/env sh

HUGO=/usr/bin/hugo
NGINX=/usr/sbin/nginx
DEFAULT_HUGO_ARGS=""
DEFAULT_HUGO_SERVE_ARGS="-v -D --appendPort=false -d /usr/share/nginx/html/ --disableLiveReload=true"

cd /src

# Arguments were passed.  Just run them.
if [ -n "$1" ]; then
  if [ "$1" = "serve" ]; then
    if [ -z "$HUGO_ARGS" ]; then
      HUGO_ARGS=$DEFAULT_HUGO_SERVE_ARGS
    fi

    # start nginx so it is listening
    nginx

    # start hugo
    hugo serve $HUGO_ARGS
    exit $?
  fi

  echo "- Using args as entry point: '$@'"
  exec "$@"
  exit $?
fi

echo "==== HUGO ===="
if [ -z "$HUGO_ARGS" ]; then
  HUGO_ARGS=$DEFAULT_HUGO_ARGS
fi
hugo $HUGO_ARGS
