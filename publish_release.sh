#!/usr/bin/env bash

file_content_type="application/octet-stream"
files_to_upload=(
  $PACKAGES_DIR/*
  $KERNEL_DIR/out/KERNEL_OBJ/*
)

for fpath in $files_to_upload
do
  echo "Uploading $fpath..."
  name=$(basename "$fpath")
  curl -X POST \
    --data-binary @$fpath \
    --header "Authorization: token $GITHUB_TOKEN" \
    --header "Content-Type: $file_content_type" \
    https://uploads.github.com/repos/$CIRRUS_REPO_FULL_NAME/releases/$CIRRUS_RELEASE/assets?name=$name
done
