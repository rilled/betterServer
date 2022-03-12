#!/bin/bash
# https://pimylifeup.com/raspberry-pi-network-scanner/
sudo apt-get install -y build-essential git libmicrohttpd-dev pkg-config zlib1g-dev libnl-3-dev libnl-genl-3-dev libcap-dev libpcap-dev libncurses5-dev libnm-dev libdw-dev libsqlite3-dev libprotobuf-dev libprotobuf-c-dev protobuf-compiler protobuf-c-compiler libsensors4-dev libusb-1.0-0-dev
git clone https://github.com/kismetwireless/kismet.git
cd kismet

# Compile Kismet
./configure
make

# Install for distro & add current user to group
sudo make suidinstall
sudo usermod -aG kismet ${USER}
groups

# Add required monitoring interfaces to Kismet config
sudo tee -a /usr/local/etc/kismet_site.conf > /dev/null <<EOT
source=mon1
source=hci0
EOT

# Create system service & enable for boot
sudo cp /home/pi/kismet/packaging/systemd/kismet.service /lib/systemd/system/
sudo tee -a  /lib/systemd/system/kismet.service > /dev/null <<EOT
[Service]
User=pi
Group=kismet
EOT

# Start Kismet Service
sudo systemctl enable --now kismet
sudo systemctl status kismet