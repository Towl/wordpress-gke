#!/bin/bash

gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS

gsutil -m cp \
  "gs://$GOOGLE_CLOUD_PROJECT/${GOOGLE_CLOUD_PREFIX}mysql-db.sql.gz" \
  "gs://$GOOGLE_CLOUD_PROJECT/${GOOGLE_CLOUD_PREFIX}wordpress.tar.gz" \
  .

tar -xzf wordpress.tar.gz && rm wordpress-languages.tar.gz
mv mysql-db.sql.gz mysql
