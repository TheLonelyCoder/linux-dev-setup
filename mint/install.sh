#!/bin/bash

set -e

sudo apt update

# Basic tools
sudo apt install -y git wget curl gpg

# Development tools

# Languages and toolchains

sudo apt install -y \
    default-jdk \
    php 
    
if ! command -v codium >/dev/null 2>&1
then
    wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
        | gpg --dearmor \
        | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

    echo -e 'Types: deb\nURIs: https://download.vscodium.com/debs\nSuites: vscodium\nComponents: main\nArchitectures: amd64 arm64\nSigned-by: /usr/share/keyrings/vscodium-archive-keyring.gpg' \
        | sudo tee /etc/apt/sources.list.d/vscodium.sources

    sudo apt update
    sudo apt install -y codium
fi

codium --install-extension redhat.java
codium --install-extension bmewburn.vscode-intelephense-client
