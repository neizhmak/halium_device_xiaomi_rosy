#!/usr/bin/env bash

file_content_type="application/octet-stream"
files_to_upload=(
  ~/linux.build
  ~/linux.buildinfo
  ~/linux.changes
  ~/bootimage.deb 
  ~/bootimage-xiaomi-rosy.deb
  ~/headers.deb
  ~/headers-xiaomi-rosy.deb
  ~/image.deb
  ~/image-xiaomi-rosy.deb
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
