#!/bin/bash
set -e

USER="frostycoolslug"
REPOSITORY="repo-test"

GPG_KEY_URL="https://${USER}.github.io/${REPOSITORY}/public.gpg"
APT_REPO_LIST_URL="https://${USER}.github.io/${REPOSITORY}/deb/beacn-on-linux.list"

# Import GPG key
curl -fsSL "$GPG_KEY_URL" | gpg --dearmor | sudo tee /usr/share/keyrings/beacn-on-linux.gpg >/dev/null

# Add APT repo
sudo curl -fsSL "$APT_REPO_LIST_URL" -o /etc/apt/sources.list.d/beacn-on-linux.list
sudo apt-get update

echo "Debian repository added. You can now install packages with apt."