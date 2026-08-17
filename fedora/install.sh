#!/bin/bash

set -e

sudo dnf install -y \
    java-latest-openjdk-devel \
    php \
    git

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
