#!/bin/bash

set -e

# Basic tools
sudo pacman -S --neded git wget curl

# Dev tools

# Development

sudo pacman -S --needed jdk-openjdk php 

if ! command -v codium >/dev/null 2>&1
then
    yay -S vscodium-bin
fi

codium --install-extension redhat.java
codium --install-extension bmewburn.vscode-intelephense-client
