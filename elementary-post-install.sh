#!/bin/bash

# Zenity
main_window=$(zenity --list --checklist \
	--height 700 \
	--width 550 \
	--title "Current Version : Loki 0.4" \
	--column= \
	--column=Name \
TRUE "Update & upgrade system"  \
TRUE "Personal Package Archives"  \
TRUE "Elementary Tweaks"  \
FALSE "Additional Drivers"  \
FALSE "Gdebi"  \
FALSE "Activate Numlock"  \
FALSE "Firefox"  \
FALSE "Deluge"  \
FALSE "Atom"  \
FALSE "Grub Customizer" \
FALSE "VLC"  \
FALSE "Archive Formats"  \
FALSE "Kdenlive"  \
FALSE "Audacity"  \
FALSE "Discord"  \
FALSE "Numix Theme"  \
FALSE "Numix Icons"  \
--separator=', ');

# Update & upgrade system
if [[ $main_window == *"Update and upgrade system"* ]]
then
	clear
	yes | sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade
fi

# Personal Package Archives (PPA)
if [[ $main_window == *"Personal Package Archives"* ]]
then
	clear
	sudo apt-get install software-properties-common -y
fi

# Elementary Tweaks
if [[ $main_window == *"Elementary Tweaks"* ]]
then
	clear
	sudo apt-get install software-properties-common -y
	sudo add-apt-repository ppa:philip.scott/elementary-tweaks -y
	sudo apt-get update -y
	sudo apt-get install elementary-tweaks -y
fi

# Additional Drivers
if [[ $main_window == *"Additional Drivers"* ]]
then
	clear
	sudo apt-get install software-properties-gtk -y
fi

# Gdebi
if [[ $main_window == *"Gdebi"* ]]
then
	clear
	sudo apt-get install gdebi -y
fi

# Activate Numlock
if [[ $main_window == *"Activate Numlock"* ]]
then
	clear
	sudo sed -i 's/#activate/activate/g' /etc/lightdm/pantheon-greeter.conf
fi

# Firefox
if [[ $main_window == *"Firefox"* ]]
then
	clear
	sudo apt-get install firefox -y
fi

# Deluge
if [[ $main_window == *"Deluge"* ]]
then
	clear
	sudo apt-get install deluge -y
fi

# Atom
if [[ $main_window == *"Atom"* ]]
then
	clear
	sudo add-apt-repository ppa:webupd8team/atom -y
	sudo apt update -y
	sudo apt install atom -y
fi

# Grub Customizer
if [[ $main_window == *"Grub Customizer"* ]]
then
	clear
	sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y
	sudo apt update -y
	sudo apt-get install grub-customizer -y
fi

# VLC
if [[ $main_window == *"VLC"* ]]
then
	clear
	sudo apt-get install vlc -y
fi

# Archives Formats
if [[ $main_window == *"Archives Formats"* ]]
then
	clear
	sudo apt install rar unrar cabextract lzip lunzip arj unace p7zip-rar p7zip -y
fi

# Kdenlive
if [[ $main_window == *"Kdenlive"* ]]
then
	clear
	sudo apt install kdenlive -y
fi

# Audacity
if [[ $main_window == *"Audacity"* ]]
then
	clear
	sudo apt install audacity -y
fi

# Discord
if [[ $main_window == *"Discord"* ]]
then
	clear
	sudo apt update -y
	sudo apt install snapd -y
	sudo snap install discord
fi

# Numix Theme
if [[ $main_window == *"Numix Theme"* ]]
then
	clear
	sudo apt-add-repository ppa:numix/ppa -y
	sudo apt-get update
	sudo apt-get install numix-gtk-theme -y
	sudo apt-get install numix-wallpaper-notd -y
	sudo apt-get install numix-wallpaper-mesh -y
	gsettings set org.gnome.desktop.interface gtk-theme Numix
fi

# Numix Icons
if [[ $main_window == *"Numix Icons"* ]]
then
	clear
	sudo apt install numix-icon-theme-circle -y
	gsettings set org.gnome.desktop.interface icon-theme Numix-Circle
	sudo sed -i 's/Inherits=Numix/Inherits=elementary/g' /usr/share/icons/Numix-Circle/index.theme
fi
