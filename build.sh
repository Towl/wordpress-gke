#!/bin/bash

gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS

gsutil -m cp \
  "gs://$GOOGLE_CLOUD_PROJECT/${GOOGLE_CLOUD_PREFIX}mysql-db.sql.gz" \
  "gs://$GOOGLE_CLOUD_PROJECT/${GOOGLE_CLOUD_PREFIX}wordpress-languages.tar.gz" \
  "gs://$GOOGLE_CLOUD_PROJECT/${GOOGLE_CLOUD_PREFIX}wordpress-plugins.tar.gz" \
  "gs://$GOOGLE_CLOUD_PROJECT/${GOOGLE_CLOUD_PREFIX}wordpress-themes.tar.gz" \
  "gs://$GOOGLE_CLOUD_PROJECT/${GOOGLE_CLOUD_PREFIX}wordpress-uploads.tar.gz" \
  .

tar -xzf wordpress-languages.tar.gz && rm wordpress-languages.tar.gz
tar -xzf wordpress-plugins.tar.gz && rm wordpress-plugins.tar.gz
tar -xzf wordpress-themes.tar.gz && rm wordpress-themes.tar.gz
tar -xzf wordpress-uploads.tar.gz && rm wordpress-uploads.tar.gz

mv mysql-db.sql.gz mysql
