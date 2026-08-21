#!/bin/bash

# Break on error
set -e

# Update
sudo zypper refresh
sudo zypper dup -y

# Basic tools
sudo zypper install -y git wget curl gpg2 dos2unix meld 
sudo zypper install -y nano vim
sudo zypper install -y gh

# Languages and toolchains
sudo zypper install -y gcc glibc-devel
sudo zypper install -y fpc 
sudo zypper install -y php8 php8-dom
sudo zypper install -y java-21-openjdk-devel
sudo zypper install -y nasm fasm
sudo zypper install -y dotnet-sdk-10.0 
sudo zypper install -y gtk3-devel gtk4-devel
sudo zypper install -y sqlite3 sqlite3-devel
sudo zypper install -y ldc

# C3 compiler
curl -fsSL https://raw.githubusercontent.com/c3lang/c3c/refs/heads/master/install/install.sh | bash
grep -qxF 'export PATH="$HOME/.c3:$PATH"' "$HOME/.bashrc" || echo 'export PATH="$HOME/.c3:$PATH"' >> "$HOME/.bashrc"

# Development tools
sudo zypper install -y lazarus
sudo zypper install -y maven 

if ! command -v codium >/dev/null 2>&1
then
    sudo tee /etc/zypp/repos.d/vscodium.repo >/dev/null <<'EOF'
[gitlab.com_paulcarroty_vscodium_repo]
name=VSCodium
baseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
metadata_expire=1h
EOF

    sudo zypper refresh
    sudo zypper install -y codium
fi

codium --install-extension redhat.java
codium --install-extension bmewburn.vscode-intelephense-client

echo "------------------------------------------------------------"
echo "--- Setup script finished, do your 'Kobayashi Maru' Test ---"
echo "------------------------------------------------------------"
