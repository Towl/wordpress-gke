#!/bin/bash

docker pull bitnami/wordpress:5
docker build -t eu.gcr.io/warm-canto-276410/wordpress:latest ./wordpress
docker push eu.gcr.io/warm-canto-276410/wordpress:latest
