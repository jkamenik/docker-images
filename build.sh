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

function exists_in_repo() {
  if [ -z "${1}" -o -z "$2" ]; then
    return 1
  fi
  
  local name=$1
  local tag=$2
  
  echo $name $tag
  
  # works because these are public
  local tags=$(curl --progress-bar "https://hub.docker.com/v2/repositories/${name}/tags/${tag}/" 2>/dev/null | tr -s '[:upper:]' '[:lower:]')
  echo $tags
  if [[ "${tags}" =~ 'not found' ]]; then
    return 1
  fi
  
  return 0
}

if [ -f "./Dockerfile" ]; then
  echo "=== Docker file found in $DIR"
  TAG=$(basename $DIR)
  IMAGE=$(dirname $DIR | sed -e "s|^${APP_DIR}/||")
  
  if [ -z "$FORCE_BUILD" ]; then
    echo "=== Checking if ${IMAGE}:${TAG} exist"
    
    if exists_in_repo "$IMAGE" "$TAG" ; then
      echo "--- existing image found, skipping"
      echo "--- use FORCE_BUILD=true to force a build"
      exit 0
    fi
  fi

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
