#!/bin/bash
set -e

NAMESPACE=$1

POD=$(kubectl -n $NAMESPACE get pod -l app.kubernetes.io/name=wordpress -o name)

echo "Push code to $POD ..."

tar -cvf - ./wordpress/wp-content/plugins | kubectl exec -i $POD -- tar xf - -C /bitnami

echo "Done"
