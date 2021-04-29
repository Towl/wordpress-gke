#!/bin/bash

VERSION=$1
docker pull bitnami/wordpress:$VERSION
docker build -t eu.gcr.io/warm-canto-276410/wordpress:$VERSION ./wordpress
docker push eu.gcr.io/warm-canto-276410/wordpress:$VERSION
