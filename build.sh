#!/bin/bash

APP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/." && pwd )"
DIR="$1"
set -e

if [ -z "$DIR" ]; then
  DIR=$APP_DIR
fi

cd $DIR

# have to clean up the DIR
DIR=$(pwd)

if [ -f "./Dockerfile" ]; then
  echo "=== Docker file found in $DIR"
  TAG=$(basename $DIR)
  IMAGE=$(dirname $DIR | sed -e "s|^${APP_DIR}/||")

  echo "TAG: $TAG"
  echo "IMAGE: $IMAGE"

  echo "=== Building ${IMAGE}:${TAG}"

  docker build -t "${IMAGE}:${TAG}" .
  docker push "${IMAGE}:${TAG}"
  exit $?
fi

dirs=$(find -L . -type d -depth 1 | grep -v .git)
echo "=== No Docker file, recursing: $dirs"
for path in $dirs; do
  $APP_DIR/build.sh $DIR/$path
done
