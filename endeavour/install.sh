#!/bin/bash

set -e

# Basic tools
sudo pacman -S --needed git wget curl

# Development tools
sudo pacman -S --needed meld

# Languages and toolchains
sudo pacman -S --needed jdk-openjdk php fasm nasm

if ! command -v codium >/dev/null 2>&1
then
    yay -S vscodium-bin
fi

codium --install-extension redhat.java
codium --install-extension bmewburn.vscode-intelephense-client
