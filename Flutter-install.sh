#!/bin/bash

################################################################################
# Flutter and android sdk install script.                                      #
# Compatible with ubuntu and ubuntu based distros.                             #
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

#Updating
print_blue "\nUpdate and upgrade packages\n"
sudo apt update -y
sudo apt upgrade -y

#Install required dependencies
print_blue "\nInstalling required dependencies\n"
sudo apt install -y libglu1-mesa xz-utils curl unzip qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils ia32-libs-multiarch
sudo apt install -y openjdk-8-jdk openjdk-8-jre

#Install flutter
print_blue "\nInstalling flutter\n"
sudo apt update -y
sudo apt install -y snapd
snap install flutter --classic
flutter --version

#Download google chrome
print_blue "\nInstalling google chrome\n"
cd ~/Downloads
rm *chrome*
wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

#Download android studio
print_blue "\nDownloading android studio\n"
cd ~/Downloads
wget "https://redirector.gvt1.com/edgedl/android/studio/ide-zips/4.2.1.0/android-studio-ide-202.7351085-linux.tar.gz"
ZIP_LOCATION=` ls $DOWNLOADS | grep "android-studio" `

#Extract android studio to home
print_blue "\nExtracting android studio to home directory\n"
tar xvzf $ZIP_LOCATION -C ~

#Run Android studio for installation
print_blue "\nRunning android studio in order to install all sdk tools easily\n"
STUDIO_DIR=` ls $HOME | grep "android-studio" `
cd ~
./$STUDIO_DIR/bin/studio.sh 

#setting up environment variables
print_blue "\nSetting up environment variables\n"
echo -e "\n# Android Studio environment variables" >> ~/.bashrc
echo "export ANDROID_SDK_ROOT=$HOME/Android/Sdk" >> ~/.bashrc
echo "export ANDROID_HOME=$ANDROID_SDK_ROOT" >> ~/.bashrc

source ~/.bashrc

#Accept android licenses and stuff
print_blue "\n Accept all android licenses \n"
flutter doctor --android-licenses

#Check things
print_blue "\n Check faults with flutter doctor\n"
flutter doctor

#Upgrade if neccesary
print_blue "\nUpgrade flutter just in case\n"
flutter upgrade

#Finish
print_green "#########################################"
print_green "##                                     ##"
print_green "##  Script has finished please reboot  ##"
print_green "##                                     ##"
print_green "#########################################"