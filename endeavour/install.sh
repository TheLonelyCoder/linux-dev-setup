#!/bin/bash

set -e

sudo pacman -S --needed jdk-openjdk php git

if ! command -v codium >/dev/null 2>&1
then
    yay -S vscodium-bin
fi

codium --install-extension redhat.java
codium --install-extension bmewburn.vscode-intelephense-client
