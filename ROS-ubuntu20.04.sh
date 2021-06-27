#!/bin/bash

##################################################################################
# ROS noetic install script. Compatible with ubuntu and ubuntu based distros.    #
# Tested only in 20.04 64-bit systems. This will NOT work on 20.10 based distros #
# Author: napuh (@napuh_) (github.com/napuh)                                     #
# Feel free to modify the code and send pull requests :D                         #
##################################################################################

#Functions to look cool
function print_green {
	echo -e "\e[1;30;42m$1\e[0m"
}

function print_blue {
	echo -e "\e[1;30;44m$1\e[0m"
}

#Setup sources
print_blue "\nSetting up sources for ROS packages\n"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

#Setup keys
print_blue "\nSetting up keys\n"
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

#Update repositories
print_blue "\nUpdating repositories\n"
sudo apt update -q >> /dev/null

#Install ROS full desktop
print_blue "\nInstalling ROS full desktop\n"
sudo apt install ros-noetic-desktop-full -y -q

#Setup environment 
print_blue "\nSetting up environment\n"
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

#Finish
print_green "#########################################"
print_green "##                                     ##"
print_green "##  Script has finished please reboot  ##"
print_green "##                                     ##"
print_green "#########################################"