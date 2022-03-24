#!/bin/bash
# https://askubuntu.com/questions/1163042/how-to-make-wavlink-usb-wifi-adapter-work-again-in-ubuntu-18-04-2-lts-after-kern
sudo apt install git build-essential dkms
sudo git clone https://github.com/gordboy/rtl8812au-5.9.3.2.git 
sudo cp -r rtl8812au-5.9.3.2 /usr/src/rtl8812au-5.9.3.2
sudo dkms add -m rtl8812au -v 5.9.3.2
sudo dkms build -m rtl8812au -v 5.9.3.2
sudo dkms install -m rtl8812au -v 5.9.3.2
sudo dkms status