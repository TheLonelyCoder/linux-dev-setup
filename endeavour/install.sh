#!/bin/bash

# Break on error
set -e

# Update
sudo pacman -Syu --noconfirm

# Basic tools
sudo pacman -S --needed --noconfirm git wget curl gnupg dos2unix
sudo pacman -S --needed --noconfirm github-cli

# Languages and toolchains
sudo pacman -S --needed --noconfirm fpc
sudo pacman -S --needed --noconfirm php
sudo pacman -S --needed --noconfirm fasm nasm
sudo pacman -S --needed --noconfirm jdk-openjdk
sudo pacman -S --needed --noconfirm jdk8-openjdk
sudo pacman -S --needed --noconfirm jdk11-openjdk

# Development tools
sudo pacman -S --needed --noconfirm lazarus
sudo pacman -S --needed --noconfirm maven

# Development tools
sudo pacman -S --needed --noconfirm meld
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
