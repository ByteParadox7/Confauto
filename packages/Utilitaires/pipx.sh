#!/bin/bash

# Installation du programme depuis le dépôt linux

apt install pipx -y

# Configuration du programme
export PIPX_HOME="/home/$MYUSER/.local/pipx"
export PIPX_BIN_DIR="/home/$MYUSER/.local/bin"

mkdir -p $PIPX_BIN_DIR
chown -R $MYUSER:$MYUSER $PIPX_BIN_DIR

su - $MYUSER -c "pipx ensurepath"

source /home/$MYUSER/.bashrc
