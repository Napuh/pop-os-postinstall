#!/bin/bash

################################################################################
# Synth shell easy install script. Compatible with bash shells.                #
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

print_green "\nStarting synth shell install script\n"

#Install powerline fonts
print_blue "\nInstalling powerline fonts\n"
git clone https://github.com/powerline/fonts.git --depth=1 -q
cd fonts
./install.sh
cd ..
rm -rf fonts

#Install synth shell
print_blue "\nInstalling synth-shell script \n"
git clone --recursive https://github.com/andresgongora/synth-shell.git -q
chmod +x synth-shell/setup.sh
cd synth-shell
./setup.sh
cd ..
rm -rf synth-shell

#Install own config with blue pallete
print_blue "\nInstalling blue pallet config \n"
rm ~/.config/synth-shell/synth-shell-prompt.config
cp ./resources/synth-shell-prompt.config ~/.config/synth-shell/

print_green "##########################################"
print_green "##                                      ##"
print_green "##   Script has finished please change  ##"
print_green "## your terminal font to one compatible ##"
print_green "##                                      ##"
print_green "##########################################"
