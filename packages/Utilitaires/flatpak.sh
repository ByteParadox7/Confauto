#!/bin/bash

# Installation du programme depuis le dépôt Linux

apt install flatpak -y

# Configuration du programme installé

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo # Ajoute le dépôt "flathub" au programme