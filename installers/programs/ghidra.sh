#!/bin/bash

dependsCheck() {
    if dpkg -l unzip >/dev/null; then
        return
    else
        sudo apt install -y unzip default-jdk
    fi
}

dependsCheck()
wget https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.1.2_build/ghidra_10.1.2_PUBLIC_20220125.zip
unzip Ghidra_10.1.2_build/ghidra_10.1.2_PUBLIC_20220125.zip