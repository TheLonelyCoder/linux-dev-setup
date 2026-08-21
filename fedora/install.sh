#!/bin/bash

# Break on error
set -e

# Update
sudo dnf upgrade -y

# Basic tools
sudo dnf install -y git wget curl gnupg2 dos2unix meld
sudo dnf install -y nano vim
sudo dnf install -y gh

# Languages and toolchains
sudo dnf install -y gcc gcc-c++ clang
sudo dnf install -y openssl-devel
sudo dnf install -y fpc
sudo dnf install -y php
sudo dnf install -y java-latest-openjdk-devel
sudo dnf install -y nasm
sudo dnf install -y dotnet-sdk-10.0 
sudo dnf install -y gtk3-devel gtk4-devel 
sudo dnf install -y sqlite sqlite-devel
sudo dnf install -y ldc

# C3 compiler
sudo dnf copr enable -y sisyphus1813/c3
sudo dnf install -y c3

# Development tools
sudo dnf install -y lazarus
sudo dnf install -y maven

if ! command -v codium >/dev/null 2>&1
then
    sudo tee /etc/yum.repos.d/vscodium.repo >/dev/null <<'EOF'
[gitlab.com_paulcarroty_vscodium_repo]
name=gitlab.com_paulcarroty_vscodium_repo
baseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
metadata_expire=1h
EOF

    sudo dnf install -y codium
fi

codium --install-extension redhat.java
codium --install-extension bmewburn.vscode-intelephense-client

echo "------------------------------------------------------------"
echo "--- Setup script finished, do your 'Kobayashi Maru' Test ---"
echo "------------------------------------------------------------"
