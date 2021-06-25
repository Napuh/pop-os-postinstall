#!/bin/bash

#Functions to look cool
function print_green {
	echo -e "\e[1;30;42m$1\e[0m\n"
}

function print_blue {
	echo -e "\e[1;30;44m$1\e[0m\n"
}

#Starting script
print_green "Starting Pop!_OS post-install script."

########################
####Install packages####
########################
print_green "Installing basic packages"

#Update and upgrade packages
print_blue "Updating packages"
sudo apt -qq update -y
sudo apt -qq upgrade -y

#Install basic dependencies and tools
print_blue "Installing basic dependencies and tools"
sudo add-apt-repository multiverse
sudo apt install -qq -y \
	ubuntu-restricted-extras \
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
	openjdk-11-jre \
	openjdk-11-jdk \
	python \
	python3 \
	python3-pip \
	cmake \
	git

#Install apt packages
print_blue "Install apt packages"
sudo apt install -qq -y \
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
print_blue "Installing sublime text"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt -qq install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt -qq install -y sublime-text

#Install snap
print_blue "Install snap"
sudo apt -qq install -y snapd

#Install snap packages
print_blue "Install snap packages"
snap install spotify
snap install flutter --classic

#Install docker
print_blue "Installing docker"
sudo apt install -y -qq \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg \
	lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt -qq install -y docker-ce docker-ce-cli containerd.io

#############################
####Update everything new####
#############################
print_green "Updating everything"
sudo apt -qq update -y
sudo apt -qq upgrade -y

######################
####Install extras####
######################
print_green "Installing extras"

#auto-editor
print_blue "Install auto-editor"
sudo apt install -y libavformat-dev libavfilter-dev libavdevice-dev ffmpeg
pip3 install --upgrade pip
pip3 install auto-editor

#mkvmerge
print_blue "Install mkvmerge"
sudo wget -O /usr/share/keyrings/gpg-pub-moritzbunkus.gpg https://mkvtoolnix.download/gpg-pub-moritzbunkus.gpg
deb [arch=amd64 signed-by=/usr/share/keyrings/gpg-pub-moritzbunkus.gpg] https://mkvtoolnix.download/ubuntu/ focal main
deb-src [arch=amd64 signed-by=/usr/share/keyrings/gpg-pub-moritzbunkus.gpg] https://mkvtoolnix.download/ubuntu/ focal main 
sudo apt install -y mkvtoolnix

#cositas para la bateria
print_blue "Install tlp"
sudo apt install -y tlp tlp-rdw

#install tldr
print_blue "Install tldr"
pip install tldr

#install thefuck
print_blue "Install thefuck"
sudo apt install -y python3-dev python3-pip python3-setuptools
pip3 install thefuck

#install pytorch
print_blue "Installing pytorch"
pip3 install torch

#install tensorflow
print_blue "Install tensorflow"
pip install tensorflow tensorflow_probability tensorboard

#add to ~/.bashrc new settings and alias
cat ./resources/nap_bash_settings >> ~/.bashrc
source ~/.bashrc

#################################
####Install vscode extensions####
#################################
print_green "Install vscode extensions"
print_blue " Installing better-comments"
code --install-extension aaron-bond.better-comments
print_blue " Installing bracket-pair-colorizer-2"
code --install-extension coenraads.bracket-pair-colorizer-2
print_blue " Installing cpptools"
code --install-extension ms-vscode.cpptools
print_blue " Installing code-gnu-global"
code --install-extension austin.code-gnu-global
print_blue " Installing dart-code"
code --install-extension dart-code.dart-code
print_blue " Installing fluent-icons"
code --install-extension miguelsolorio.fluent-icons
print_blue " Installing flutter"
code --install-extension dart-code.flutter
print_blue " Installing vscode-yaml"
code --install-extension redhat.vscode-yaml
print_blue " Installing vscode-pull-request-github"
code --install-extension github.vscode-pull-request-github
print_blue " Installing cmake-tools"
code --install-extension ms-vscode.cmake-tools
print_blue " Installing cmake"
code --install-extension twxs.cmake
print_blue " Installing cpptools-themes"
code --install-extension ms-vscode.cpptools-themes
print_blue " Installing cpptools-extension-pack"
code --install-extension ms-vscode.cpptools-extension-pack
print_blue " Installing better-cpp-syntax"
code --install-extension jeff-hykin.better-cpp-syntax

###############################
####Customize gnome desktop####
###############################

print_green "Custimizing gnome desktop"
sudo apt -qq install -y gnome-tweaks

#Restore some gnome settings
print_blue "Restoring some gnome settings"
dconf load /org/gnome/ < ./resources/nap_gnome_settings

# Time and Gnome Top Bar settings
print_blue "Adjusting time settings"
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.datetime automatic-timezone true
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.interface clock-format '24h'

#Apply nordic-darker theme
print_blue "Setting Nordic-darker theme"
mkdir ~/.themes
cp -r ./resources/Nordic-darker ~/.themes
gsettings set org.gnome.desktop.interface gtk-theme 'Nordic-darker'
gsettings set org.gnome.desktop.interface icon-theme 'Pop'

#Set wallpapers
print_blue "Setting wallpaper"
cp nap-wallpaper.jpg ~/.themes
gsettings set org.gnome.desktop.background picture-uri ~/.themes/nap-wallpaper.jpg
gsettings set org.gnome.desktop.screensaver picture-uri ~/.themes/nap-wallpaper.jpg

#Enable maximize button
print_blue "Enable maximize button"
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

#Set keyboard layouts
print_blue "Setting keyboard layouts"
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'us+intl')]"

#Set tap to click on
print_blue "Setting tap to click on"
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

#Set natural scroll true
print_blue "Set natural-scroll true"
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true

#Set lockscreen time to 15 minutes
print_blue "Setting lock screen time to 15 minutes"
gsettings set org.gnome.desktop.screensaver lock-delay 300

#Install dash to dock manually
print_blue "Install manually dash to dock"
firefox https://extensions.gnome.org/extension/307/dash-to-dock/

###################################
####Final update for the system####
###################################
print_green "Final update for the system"
sudo apt -qq update -y
sudo apt -qq upgrade -y
sudo apt autoremove -y --purge
sudo apt autoclean -y

##############
####Finish####
##############
print_green "#########################################"
print_green "##                                     ##"
print_green "##  Script has finished please reboot  ##"
print_green "##                                     ##"
print_green "#########################################"
