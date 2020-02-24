#!/bin/bash

TARGET_REPO=mneundorfer/owserver
VERSION=1.0

for arch in amd64 arm64 armv7; do
	docker build -t $TARGET_REPO:${arch}-${VERSION} .
	docker push $TARGET_REPO:${arch}-${VERSION}
done

docker manifest create $TARGET_REPO:latest $TARGET_REPO:amd64-$VERSION $TARGET_REPO:arm64-$VERSION $TARGET_REPO:armv7-$VERSION
docker manifest annotate $TARGET_REPO:latest $TARGET_REPO:arm64-$VERSION --os linux --arch arm64
docker manifest annotate $TARGET_REPO:latest $TARGET_REPO:armv7-$VERSION --os linux --arch arm
docker manifest push $TARGET_REPO:latest
