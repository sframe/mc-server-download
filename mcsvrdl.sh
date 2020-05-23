#! /bin/bash

declare -r MC_SNAPSHOT=20w21a
declare -r MC_MANIFEST_URL=https://launchermeta.mojang.com/mc/game/version_manifest.json
declare -r MC_VERSION_URL=$(curl --silent $MC_MANIFEST_URL | jq --arg snapshot $MC_SNAPSHOT -c '.versions[] | select(.id | contains($snapshot)) | .url' | tr -d '"')
declare -r MC_SERVER_URL=$(curl --silent $MC_VERSION_URL | jq -c '.downloads.server.url' | tr -d '"')

curl --silent ${MC_SERVER_URL} -o server.jar
