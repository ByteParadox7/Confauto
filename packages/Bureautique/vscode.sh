#!/bin/bash

# Installation d'un paquet .DEB depuis Internet

wget https://go.microsoft.com/fwlink/?LinkID=760868 --show-progress -q -O vscode.deb

apt install ./*.deb -y

rm -rf vscode.deb


