#!/bin/bash
LOCAL_DIR="/srv/nas/data/k8s/nextcloud"
S3_BUCKET="s3://bannerbucket69"

echo "$(date): Starting two-way sync..."

echo "$(date): Local -> S3 (NAS to AWS)"
aws s3 sync "$LOCAL_DIR" "$S3_BUCKET"

echo "$(date): S3 -> Local (AWS to NAS)"  
aws s3 sync "$S3_BUCKET" "$LOCAL_DIR"

echo "$(date): Two-way sync complete!"

