#!/bin/bash
# https://github.com/firstlookmedia/dangerzone/blob/main/BUILD.md

# Install Podman
sudo apt update -y && sudo apt upgrade -y
sudo sh -c "echo 'deb [trusted=yes] http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /' > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list"
# If ${VERSION_ID} not working, `source /etc/os-release` or replace variable with 20.04

# Add key to /etc/apt/
wget -nv https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/xUbuntu_${VERSION_ID}/Release.key -O- | sudo apt-key add -

sudo apt update -qq -y
sudo apt -qq --yes install podman

git clone https://github.com/firstlookmedia/dangerzone.git
sudo apt install -y dh-python python3 python3-stdeb python3-pyside2.qtcore python3-pyside2.qtgui python3-pyside2.qtwidgets python3-appdirs python3-click python3-xdg python3-requests python3-colorama python3-psutil
./install/linux/build-image.sh
./dev_scripts/dangerzone
./install/linux/build-deb.py
sudo apt install ./deb_dist/dangerzone*.deb