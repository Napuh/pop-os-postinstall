
#!/bin/bash

#Funciones para que se vea bonico
function echo_green {
	echo -e "\e[1;30;42m$1\e[0m\n"
}

function echo_blue {
	echo -e "\e[1;30;44m$1\e[0m\n"
}

#Starting script
echo_green "Starting Pop!_OS post-install script."

####Install packages####

#Update and upgrade packages
echo_blue "Updating packages"
sudo apt update -y
sudo apt upgrade -y

#Install basic dependencies and tools
echo_blue "Installing basic dependencies and tools"
sudo apt install -y\
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
echo_blue "Install apt packages"
sudo apt install -y\
	aqemu \
	timeshift \
	deja-dup \
	flameshot \
	obs-studio \
	gnome-tweaks \
	virtualbox \
	virtualbox-ext-pack \
	software-properties-common \
	code \
	wireshark \
	nmap \
	gparted

#Install sublime text
echo_blue "Installing sublime text"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install -y sublime-text

#Install snap packages
echo_blue "Install snap packages"
sudo snap install -y\
	discord \
	flutter \
	spotify

#Install docker
echo_blue "Installing docker"
sudo apt install \
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
sudo apt-get install docker-ce docker-ce-cli containerd.io

#Update everything new
echo_green "Updating everything"
sudo apt update -y
sudo apt upgrade -y

#Install extras
echo_blue "Installing extras"
#auto-editor
sudo apt install -y libavformat-dev libavfilter-dev libavdevice-dev ffmpeg
pip3 install --upgrade pip
pip3 install auto-editor
#mkvmerge
sudo wget -O /usr/share/keyrings/gpg-pub-moritzbunkus.gpg https://mkvtoolnix.download/gpg-pub-moritzbunkus.gpg
deb [arch=amd64 signed-by=/usr/share/keyrings/gpg-pub-moritzbunkus.gpg] https://mkvtoolnix.download/ubuntu/ focal main
deb-src [arch=amd64 signed-by=/usr/share/keyrings/gpg-pub-moritzbunkus.gpg] https://mkvtoolnix.download/ubuntu/ focal main 
sudo apt install -y mkvtoolnix
#cositas para la bateria
sudo apt install -y tlp tlp-rdw
#install tldr
pip install tldr
#install fuck
sudo apt install -y python3-dev python3-pip python3-setuptools
sudo pip3 install thefuck

#Install vscode extensions
code --install-extension aaron-bond.better-comments
code --install-extension coenraads.bracket-pair-colorizer-2
code --install-extension ms-vscode.cpptools
code --install-extension austin.code-gnu-global
code --install-extension dart-code.dart-code
code --install-extension miguelsolorio.fluent-icons
code --install-extension dart-code.flutter
code --install-extension redhat.vscode-yaml
code --install-extension github.vscode-pull-request-github
code --install-extension ms-vscode.cmake-tools
code --install-extension twxs.cmake
code --install-extension ms-vscode.cpptools-themes
code --install-extension ms-vscode.cpptools-extension-pack
code --install-extension jeff-hykin.better-cpp-syntax
code --install-extension aaron-bond.better-comments

#Customize gnome desktop
echo_blue "Custimizing gnome desktop"
sudo apt install -y gnome-tweaks
# Time and Gnome Top Bar settings
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.datetime automatic-timezone true
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.interface clock-format '24h'
#Apply nordic-darker theme
mkdir ~/.themes
cp -r Nordic-darker ~/.themes
gsettings set org.gnome.desktop.interface gtk-theme 'Nordic-darker'
gsettings set org.gnome.desktop.interface icon-theme 'Pop'
#Set wallpapers
cp nap-wallpaper.jpg ~/.themes
gsettings set org.gnome.desktop.background picture-uri ~/.themes/nap-wallpaper.jpg
gsettings set org.gnome.desktop.screensaver picture-uri ~/.themes/nap-wallpaper.jpg
#Enable maximize button
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'
#Install dash to dock
sudo apt install gnome-shell-extensions -y

gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide-mode 'ALL_WINDOWS'
gsettings set org.gnome.shell.extensions.dash-to-dock apply-custom-theme true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false