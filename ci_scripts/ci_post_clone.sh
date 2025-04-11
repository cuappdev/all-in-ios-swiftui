#!/bin/bash

echo "Downloading Secrets"
brew install wget
cd "$CI_PRIMARY_REPOSITORY_PATH/All in"

ls -a

echo "$CI_PRIMARY_REPOSITORY_PATH/All in"

if [ ! -d "Supporting" ]; then
    mkdir -p Supporting
    echo "Created Supporting directory"
else
    echo "Supporting directory already exists"
fi

wget -O Supporting/Keys.xcconfig "$KEYS"
wget -O Supporting/GoogleService-Info.plist "$GOOGLE_INFO_PLIST"
