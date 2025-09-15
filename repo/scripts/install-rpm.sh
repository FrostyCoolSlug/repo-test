#!/bin/bash
set -e

USER="frostycoolslug"
REPOSITORY="repo-test"

# Detect OSTree immutable system
if [ -f /run/ostree-booted ]; then
    echo "Immutable OSTree-based system detected. Use the Flatpak version:"
    echo "  https://${USER}.github.io/${REPOSITORY}/scripts/install-flatpak.sh"
    exit 1
fi

GPG_KEY_URL="https://${USER}.github.io/${REPOSITORY}/public.gpg"
RPM_REPO_URL="https://${USER}.github.io/${REPOSITORY}/rpm/beacn-on-linux.repo"

# Import GPG key for verification
curl -fsSL "$GPG_KEY_URL" | gpg --dearmor | sudo tee /usr/share/keyrings/beacn-on-linux.gpg >/dev/null

# Install RPM repo file
sudo curl -fsSL "$RPM_REPO_URL" -o /etc/yum.repos.d/beacn-on-linux.repo
echo "RPM repository added. You can now install packages with dnf/yum."
