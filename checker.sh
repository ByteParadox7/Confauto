#!/bin/bash

apt_packages=`cat ./packages/apt`
flatpak_packages=`cat ./packages/flatpak`
custom_packages=`ls ./packages/custom`

# Check si tout les paquets on bien été installés
list_package_apt=`apt list --installed`
list_package_flatpak=`flatpak list`
list_package_custom=`ls /usr/local/bin/`

# Check APT
echo -e "\e[1;33mChecking des paquets APT installé.\e[0m"
for package in $apt_packages
do
	found=`echo "$list_package_apt" | cut -d/ -f1 | grep -i -E "^$package$"`
	
	if [[ $found ]]
	then
		echo -e "\e[1;32m$package is installed\e[0m"
	else
		echo -e "\e[1;31m$package is not installed\e[0m"
	fi
done

# Check FLATPAK
echo -e "\e[1;33mChecking des paquets FLATPAK installé.\e[0m"
for package in $flatpak_packages
do
	found=`echo "$list_package_flatpak" | grep "$package" | tr "\t" ";" | cut -d";" -f1`
	
	if [[ $found ]]
	then
		echo -e "\e[1;32m$package is installed\e[0m"
	else
		echo -e "\e[1;31m$package is not installed\e[0m"
	fi
done

# Check CUSTOM
echo -e "\e[1;33mChecking des paquets CUSTOM installé.\e[0m"
for package in $custom_packages
do
	package_name=`echo "$package" | cut -d"." -f1` 
	found=`echo "$list_package_custom" | cut -d"." -f1 | grep -i "$package_name"`

	if [[ $found ]]
	then
		echo -e "\e[1;32m$package_name is installed\e[0m"
	else
		echo -e "\e[1;31m$package_name is not installed\e[0m"
	fi
done
