#!/bin/bash
set -e

INSTANCE=$1
PLUGIN=$2

POD=$(kubectl get pod -l app.kubernetes.io/instance=$INSTANCE -o name)

echo "Push code to $POD ..."

tar -cvf - ./wordpress/wp-content/plugins/$PLUGIN | kubectl exec -i $POD -- tar xf - -C /bitnami

echo "Done"
