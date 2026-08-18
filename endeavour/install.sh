#!/bin/bash

# Break on error
set -e

# Update 
sudo pacman -Syu --noconfirm

# Basic tools
sudo pacman -S --needed --noconfirm git wget curl dos2unix

# Languages and toolchains
sudo pacman -S --needed --noconfirm jdk-openjdk php 
sudo pacman -S --needed --noconfirm fasm nasm
sudo pacman -S --needed --noconfirm fpc 

# Development tools
sudo pacman -S --needed meld
sudo pacman -S --needed --noconfirm lazarus

if ! command -v codium >/dev/null 2>&1
then
    yay -S vscodium-bin
fi

codium --install-extension redhat.java
codium --install-extension bmewburn.vscode-intelephense-client

echo "------------------------------------------"
echo "Setup script finished."
echo "------------------------------------------"
