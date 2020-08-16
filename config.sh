#!/bin/bash

## Before execute this script, inser your name and email ##
NAME="Your Name"
EMAIL="Your e-mail"

echo ""
echo "*******************************************************************"
echo "************************* SCRIPT START ****************************"
echo "*******************************************************************"
echo ""

## Removing eventual locks from apt ##
sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock;

## Repository update ##
sudo apt update

## Installing external packages ##
mkdir /home/$USER/Downloads/programs
cd /home/$USER/Downloads/programs
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i *.deb

## Installing and configure GIT ##
sudo apt install git -y
git config --global user.name $NAME
git config --global. user.email $EMAIL

## Installing dracula gnome-terminal (need execute after git installation).
sudo apt-get install dconf-cli -y
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh

## Install Flameshot ##
sudo apt install flameshot -y

## Install programs by Snap ##
sudo apt install snapd -y
sudo snap install insomnia
sudo snap install skype --classic
sudo snap install code --classic
sudo snap install teams-for-linux
#sudo snap isntall spotify

## Install Runtime and SDK for C#  by Snap ##
sudo snap install dotnet-sdk --classic --channel=3.1 
sudo snap alias dotnet-sdk.dotnet dotnet
sudo snap install dotnet-runtime-31 --classic
sudo snap alias dotnet-runtime-31.dotnet dotnetd

## Installing Node.js LTS ##
sudo apt install curl -y
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install nodejs -y

## Installing Fira-Code Font ##
sudo apt install fonts-firacode -y

## Generating new SSH-key ##
ssh-keygen -t rsa -b 4096 -C $EMAIL

## Add the SSH-key to ssh-agent ##
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub > /home/$USER/Desktop/ssh_for_github.txt

## System update ##
sudo apt update && sudo apt dist-upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y &&

clear

## Script ending ##
echo ""
echo "*******************************************************************"
echo "************************** SCRIPT END *****************************"
echo "*******************************************************************"
echo ""
