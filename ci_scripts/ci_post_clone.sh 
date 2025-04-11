#!/bin/bash

# Create directory for Keys.xcconfig if it doesn't exist
mkdir -p "/Volumes/workspace/repository/All In/Supporting"

# Set the Google Drive file ID and destination path
FILE_ID="1hXxXmo97NZUcOXeBDnFKDO4ZFuO8JgN-"
DESTINATION="/Volumes/workspace/repository/All In/Supporting/Keys.xcconfig"

# Download the file using curl
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${FILE_ID}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${FILE_ID}" -o ${DESTINATION} :antCitation[]{citations="0c1818b3-7257-40a8-b08a-db4924de8521"}

echo "Keys.xcconfig file downloaded successfully"

# Make sure the file is readable
chmod 644 "${DESTINATION}"

# Display success message
echo "Build environment prepared successfully"
