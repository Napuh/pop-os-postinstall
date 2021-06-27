#!/bin/bash

#Updating
sudo apt update -y
sudo apt upgrade -y

#Install required dependencies
sudo apt install -y libglu1-mesa xz-utils curl unzip qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils ia32-libs-multiarch

#Install flutter
sudo apt update -y
sudo apt install -y snapd
snap install flutter --classic
flutter --version

#Download google chrome
cd ~/Downloads
wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

#Download android studio
cd ~/Downloads
wget "https://redirector.gvt1.com/edgedl/android/studio/ide-zips/4.2.1.0/android-studio-ide-202.7351085-linux.tar.gz"
ZIP_LOCATION = 'ls ~/Downloads | grep android-studio'

#Extract android studio to home
unzip ~/Downloads/ZIP_LOCATION -d $JAVA_HOME

#Run Android studio for installation
STUDIO_DIR = 'ls $HOME | grep "android-studio"'
cd $JAVA_HOME./$STUDIO_DIR/bin/studio.sh

#setting up environment variables
echo -e "\n# Android Studio environment variables" >> ~/.bashrc
echo "export ANDROID_SDK_ROOT=$HOME/Android/Sdk" >> ~/.bashrc
echo "export ANDROID_HOME=$ANDROID_SDK_ROOT" >> ~/.bashrc

source ~/.bashrc

#Check things
flutter doctor