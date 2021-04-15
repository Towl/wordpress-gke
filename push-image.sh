#!/bin/bash

VERSION=$1
docker pull bitnami/wordpress:5
#cp ./wordpress/bkp/*.pem ./wordpress
docker build -t eu.gcr.io/warm-canto-276410/wordpress:latest ./wordpress
docker build -t eu.gcr.io/warm-canto-276410/wordpress:$VERSION ./wordpress
docker push eu.gcr.io/warm-canto-276410/wordpress:latest
docker push eu.gcr.io/warm-canto-276410/wordpress:$VERSION
