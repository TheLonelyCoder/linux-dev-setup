#!/bin/bash

# Break on error
set -e

# Update
sudo apt update

# Basic tools
sudo apt install -y git wget curl gpg dos2unix meld 
sudo apt install -y nano vim
sudo apt install -y gh

# Languages and toolchains
sudo apt install -y fpc 
sudo apt install -y php php-xml
sudo apt install -y default-jdk openjdk-8-jdk openjdk-11-jdk
sudo apt install -y nasm fasm
sudo apt install -y dotnet-sdk-10.0 
sudo apt install -y libgtk-3-dev libgtk-4-dev 
sudo apt install -y sqlite3 libsqlite3-dev
sudo apt install -y c3c
sudo apt install -y ldc

# Development tools
sudo apt install -y lazarus
sudo apt install -y maven 

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

echo "------------------------------------------------------------"
echo "--- Setup script finished, do your 'Kobayashi Maru' Test ---"
echo "------------------------------------------------------------"
