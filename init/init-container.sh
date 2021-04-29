#!/bin/bash

docker-compose stop
docker-compose rm
rm -rf wordpress
mkdir wordpress
docker-compose up
