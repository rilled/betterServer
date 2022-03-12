#!/bin/bash
# https://pimylifeup.com/raspberry-pi-network-scanner/
sudo apt update -y && sudo apt upgrade -y

# https://unix.stackexchange.com/questions/77277/how-to-append-multiple-lines-to-a-file
sudo tee -a /etc/network/interfaces > /dev/null <<EOT
 allow-hotplug wlan1
 iface wlan1 inet manual
 pre-up iw phy phy1 interface add mon1 type monitor
 pre-up iw dev wlan1 del
 pre-up ifconfig mon1 up
EOT
sudo reboot