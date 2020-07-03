#!/bin/bash

TARGET_REPO=mneundorfer/owserver
VERSION=1.0

docker buildx build --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag $TARGET_REPO:latest --tag $TARGET_REPO:$VERSION --push .
