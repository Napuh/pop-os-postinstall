#!/bin/bash

################################################################################
# Synth shell easy install script. Compatible with bash shells.                #
# Tested only in 20.04 64-bit systems                                          #
# Author: napuh (@napuh_) (github.com/napuh)                                   #
# Feel free to modify the code and send pull requests :D                       #
################################################################################

#Install powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

#Install synth shell
git clone --recursive https://github.com/andresgongora/synth-shell.git
chmod +x synth-shell/setup.sh
cd synth-shell
./setup.sh
cd ..
rm -rf synth-shell

#Install own config with blue pallete
rm ~/.config/synth-shell/synth-shell-prompt.config
cp ./resources/synth-shell-prompt.config ~/.config/synth-shell/
