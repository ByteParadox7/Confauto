#!/bin/bash

# Installation d'un programme d'un programme .DEB
curl -s https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | jq -r '.assets[] | select(.name | test(".*amd64.*\\.deb$")) | .browser_download_url' | xargs -n 1 curl -L -O -H "Accept: application/octet-stream" # Modifier l'username et le repo

apt install ./*.deb -y

rm *.deb