#!/bin/bash

echo -e "Confauto - Script d'installation et de configuration automatique\n"
echo -e "                                           Ecrit par ByteParadox\n"
sleep 2

users=`cat /etc/passwd | grep -E "/home/" | cut -d : -f1`
run=true

# Selection de l'utilisateur
while [[ $run == true  ]]
do
	echo $users
	read -p "Pour quel utilisateur voulez-vous principalement installer les outils ? " response  
	
	if [[ $users =~ $response ]]
	then
		export MYUSER=$response
		run=false
	fi
done

# Configuration du systeme d'exploitation
bash os_config.sh

# Installation des paquets
bash ./installer.sh

# Configuration des programmes installé
# TODO

# Checking des installations
# bash ./checker.sh

run=true

# Redémarrage de l'OS
while [[ $run == true ]]
do
	
	read -p "Il est recommandé de redémarrer le système pour que certains programme puisse fonctionner. Voulez redémarrer l'OS maintenant ? (Y/N) " response

	if [[ $response = "Y" || $response = "y" ]]
	then
		/sbin/reboot
	elif [[ $response = "N" || $response = "n" ]]
	then
		run=false
		echo -e "\e[1;33mFin du script\e[0m"
	fi
done
