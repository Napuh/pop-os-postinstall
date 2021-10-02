# Napuh Pop!_OS postinstall script
Quick scripts to install basic packages and customize gnome desktop quickly after a Pop!_OS installation.
These script are designed to work with Pop!_OS 20.04, but they may work on Ubuntu 20.04 and other Ubuntu based distros. 
These scripts configure the OS and the gnome experience to my liking, so feel free to modify the script in order to make it look good to you. 
## How to run
In order to run the basic install script you need to first give execution permission:
```bash
chmod +x Pop-OS-postinstall.sh
./Pop-OS-postinstall.sh
```
Take into account that the script is not 100% automatic, you'll need to input your password a couple times, accept the EULA of the ubuntu-restricted-extras package and install dash-to-dock with the browser extension (could't find a better way), so do not leave the script running unsupervised.  
## ROS and full flutter install
There's other two scripts in order to install ROS (Only for Ubuntu 20.04 and 20.04 based distros) and Flutter with the Android SDK and everything necessary.
It is recommended that these scripts are executed after the Pop-OS postinstall script.

## Synth shell install
I've also included a quick synth shell install script with my personal configuration, but when the script finishes it is recommended changing the terminal font to one compatible with powerline fonts. I use Hack Regular with size 10.