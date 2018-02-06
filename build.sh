#!/bin/bash -x

VERSION="$1"
TAG="aanno/nextcloud:${VERSION}"

if [ -z "$VERSION" ]; then
	echo "Usage: build.sh VERSION (e.g. 'build.sh  11.0.6-apache');"
	exit -1;
fi

docker build --pull -t "$TAG" .
docker push "$TAG"
