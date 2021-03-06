#!/bin/bash

################################################################################
# Pop!_OS postinstall script. Compatible with ubuntu and ubuntu based distros. #
# Tested only in 20.04 64-bit systems                                          #
# Author: napuh (@napuh_) (github.com/napuh)                                   #
# Feel free to modify the code and send pull requests :D                       #
################################################################################

#Functions to look cool
function print_green {
	echo -e "\e[1;30;42m$1\e[0m"
}

function print_blue {
	echo -e "\e[1;30;44m$1\e[0m"
}

#Starting script
print_green "\nStarting Pop!_OS post-install script.\n"
#Set idle time to 60 minutes so script does not stop 
gsettings set org.gnome.desktop.session idle-delay 3600

########################
####Install packages####
########################
print_green "\nInstalling basic packages\n"

#Update and upgrade packages
print_blue "\nUpdating packages\n"
sudo apt-get -qq update -y >> /dev/null
sudo apt-get -qq upgrade -y >> /dev/null

#Install basic dependencies and tools
print_blue "\nInstalling basic dependencies and tools\n"
sudo add-apt-repository multiverse >> /dev/null
print_blue "\nInstalling ubuntu restricted extras. You may need to accept the EULA of the microsoft fonts\n"
sudo apt-get -qq install -y ubuntu-restricted-extras
print_blue "\nInstalling other basic tools\n"
sudo apt-get -qq install -y \
	curl \
	neofetch \
	screenfetch \
	vlc \
	zip \
	unzip \
	rar \
	gcc \
	make \
	build-essential \
	openjdk-8-jre \
	openjdk-8-jdk \
	python \
	python3 \
	python3-pip \
	cmake \
	git \
	npm

#Install apt packages
print_blue "\nInstall apt packages\n"
sudo apt-get install -qq -y \
	aqemu \
	timeshift \
	deja-dup \
	flameshot \
	obs-studio \
	gnome-tweaks \
	virtualbox \
	software-properties-common \
	code \
	nmap \
	gparted \
	discord \
	transmission \
	tree \
	ssh \
	aptitude \
	vim

#Install sublime text
print_blue "\nInstalling sublime text\n"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt -qq install -y apt-transport-https 
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update >> /dev/null
sudo apt -qq install -y sublime-text 

#Install snap
print_blue "\nInstall snap\n"
sudo apt-get -qq install -y snapd 

#Install snap packages
print_blue "\nInstall snap packages\n"
snap install spotify

#Install docker
print_blue "\nInstalling docker\n"
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo apt-get -qq install -y docker-ce docker-ce-cli containerd.io 
sudo apt-get install docker-compose
rm get-docker.sh

#############################
####Update everything new####
#############################
print_green "\nUpdating everything\n"
sudo apt-get -qq update -y >> /dev/null
sudo apt-get -qq upgrade -y >> /dev/null

######################
####Install extras####
######################
print_green "\nInstalling extras\n"

#auto-editor
print_blue "\nInstall auto-editor\n"
sudo apt-get install -y libavformat-dev libavfilter-dev libavdevice-dev ffmpeg
pip3 install --upgrade pip
pip3 install auto-editor

#cositas para la bateria
print_blue "\nInstall tlp\n"
sudo apt-get install -y tlp tlp-rdw 

#install tldr
print_blue "\nInstall tldr\n"
pip install tldr

#install thefuck
print_blue "\nInstall thefuck\n"
sudo apt-get install -y python3-dev python3-pip python3-setuptools 
sudo pip3 install thefuck

#add to ~/.bashrc new settings and alias
cat ./resources/nap_bash_settings >> ~/.bashrc
source ~/.bashrc

#Apply fixes to ubuntu USB transfer
echo vm.dirty_bytes=50331648 | sudo tee -a /etc/sysctl.conf
echo vm.dirty_background_bytes=16777216 | sudo tee -a /etc/sysctl.conf

############################################
####No more install of vscode extensions####
####   because of auto sync in vscode   ####
############################################


###############################
####Customize gnome desktop####
###############################

print_green "\nCustimizing gnome desktop\n"
sudo apt-get -qq install -y gnome-tweaks 

#Restore some gnome settings
print_blue "\nRestoring some gnome settings\n"
dconf load /org/gnome/ < ./resources/nap_gnome_settings

# Time and Gnome Top Bar settings
print_blue "\nAdjusting time settings\n"
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.datetime automatic-timezone true
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.interface clock-format '24h'

#Apply nordic-darker theme
print_blue "\nSetting Nordic-darker theme\n"
mkdir ~/.themes
cp -r ./resources/Nordic-darker ~/.themes
gsettings set org.gnome.desktop.interface gtk-theme 'Nordic-darker'
gsettings set org.gnome.desktop.interface icon-theme 'Pop'

#Set wallpapers
print_blue "\nSetting wallpaper\n"
cp ./resources/nap-wallpaper.jpg ~/.themes
gsettings set org.gnome.desktop.background picture-uri ~/.themes/nap-wallpaper.jpg
gsettings set org.gnome.desktop.screensaver picture-uri ~/.themes/nap-wallpaper.jpg

#Enable maximize button
print_blue "\nEnable maximize button\n"
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

#Set keyboard layouts
print_blue "\nSetting keyboard layouts\n"
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'us+intl')]"

#Set tap to click on
print_blue "\nSetting tap to click on\n"
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

#Set natural scroll true
print_blue "\nSet natural-scroll true\n"
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true

#Set idle time to 15 minutes
print_blue "\nSetting idle time to 15 minutes\n"
gsettings set org.gnome.desktop.session idle-delay 900

#Set lockscreen time to 15 minutes
print_blue "\nSetting lock screen time to 5 minutes\n"
gsettings set org.gnome.desktop.screensaver lock-delay 300

#Set the correct theme for the terminal
print_blue "\nSetting the correct theme for the terminal\n"
dconf load /org/gnome/terminal/legacy/profiles:/:84b4775b-f78b-4e72-955b-fa81e77344be/ < ./resources/nap_terminal_theme

#Install dash to dock manually
print_blue "\nInstall manually dash to dock\n"
firefox https://extensions.gnome.org/extension/307/dash-to-dock/

#Install user themes extensions
print_blue "\nInstall user themes extension\n"
firefox https://extensions.gnome.org/extension/19/user-themes/

###################################
####Final update for the system####
###################################
print_green "\n Final update for the system \n"
sudo apt-get -qq update -y >> /dev/null
sudo apt-get -qq upgrade -y >> /dev/null
sudo apt-get autoremove -y --purge >> /dev/null
sudo apt-get autoclean -y >> /dev/null

##############
####Finish####
##############
print_green "#########################################"
print_green "##                                     ##"
print_green "##  Script has finished please reboot  ##"
print_green "##                                     ##"
print_green "#########################################"
