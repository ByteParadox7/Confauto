#!/bin/bash

# Installation du programme depuis le dépôt Linux

apt install virtualenv -y

# Configuration de l'environnement virtual python

mkdir /home/$MYUSER/.python_env			    # Création d'un répertoire pour l'environnement virtual python
virtualenv /home/$MYUSER/.python_env/venv	# Création de l'environnement virtual python

echo 'alias pip="/home/$USER/.python_env/venv/bin/pip3"' >> /home/$MYUSER/.bashrc
source /home/$MYUSER/.bashrc

chown -R $MYUSER:$MYUSER /home/$MYUSER/.python_env
