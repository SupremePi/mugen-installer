#!/bin/bash
#
# Description : Easy Mugen Setup
# Author      : Supreme Team
# Version     : 1.0
#
clear

readonly INSTALL_DIR="/tmp/"
readonly MUGEN_INSTALLER_URL="https://github.com/SupremePi/Mugen-Installer/raw/main/mugen-installer.sh"

install() {
    local IS_RASPBERRYPI
    IS_RASPBERRYPI=$(grep </proc/cpuinfo 'BCM2711')
    cd "$INSTALL_DIR" || exit 1

    if [[ -z $IS_RASPBERRYPI ]]; then
        echo "Sorry.The mugen installer is only available for Raspberry Pi 4 boards."
        sleep 5
        exit
    fi

    if [[ ! -d $HOME/RetroPie-Setup ]]; then
        echo "Sorry.The mugen installer is only available for builds with RetroPie installed."
        sleep 5
        exit
    fi

    wget -q "$MUGEN_INSTALLER_URL" 
    sudo chmod +x /tmp/mugen-installer.sh 2>/dev/null
    /tmp/mugen-installer.sh
    clear && cd "$_" || exit 1
}

install
