#!/bin/bash

# Emplacement des scripts d'installation
bureautique_packages=`ls ./packages/Bureautique | cut -d . -f1`
hacking_packages=`ls ./packages/Hacking | cut -d . -f1`
utilitaires_packages=`ls ./packages/Utilitaires | cut -d . -f1`
export DIR_TOOLS="/opt/pentest"
export DEBIAN_FRONTEND=noninteractive

# Mise à jour des dépot Linux
echo -e "\e[1;33mMise à jour du dépôt Linux\e[0m"
sleep 1
apt update
sleep 3
clear

# Installation des Utilitaires
echo -e "\e[1;33mLancement des installations des programmes Utilitaire\e[0m"
for script in $utilitaires_packages
do
	echo -e "\e[1;93mInstallation du programme - $script\e[0m"
	sleep 1
	bash ./packages/Utilitaires/$script.sh
	clear
done

# Installation des logiciels Bureautique
echo -e "\e[1;33mLancement des installations des programmes de Bureautique\e[0m"
for script in $bureautique_packages
do
	echo -e "\e[1;93mInstallation du programme - $script\e[0m"
	sleep 1
	bash ./packages/Bureautique/$script.sh
	clear
done

# Création du répertoire des outils de pentest
echo -e "\e[1;33mCréation du répertoire 'Pentest' ou seront stocké les outils de hacking\e[0m"
mkdir $DIR_TOOLS
sleep 1
clear

# Installation des outils de Hacking
echo -e "\e[1;33mLancement des installationss des programmes de Hacking\e[0m"
for script in $hacking_packages
do
	echo -e "\e[1;93mInstallation du programme - $script\e[0m"
	sleep 1
	bash ./packages/Hacking/$script.sh
	clear
done

# Mise à jour des paquet et de leur dépendances
echo -e "\e[1;33mMise à niveau complet des programmes et de leur dépendances\e[0m\n"
apt full-upgrade -y
apt autoremove -y
apt autoclean
