#!/bin/bash

echo "Downloading Secrets"
brew install wget
cd $CI_PRIMARY_REPOSITORY_PATH/ci_scripts
mkdir ../ScoreSecrets
wget -O ../Supporting/Keys.xcconfig "$KEYS"
wget -O ../Supporting/GoogleService-Info.plist "$GOOGLE_INFO_PLIST"
