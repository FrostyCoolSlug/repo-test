#!/bin/bash
set -e

USER="frostycoolslug"
REPOSITORY="repo-test"

GPG_KEY_URL="https://${USER}.github.io/${REPOSITORY}/public.gpg"
FLATPAK_REPO_URL="https://${USER}.github.io/${REPOSITORY}/beacn-on-linux.flatpakrepo"

echo "Downloading public GPG key..."
TMP_KEY="$(mktemp)"
curl -fsSL "${GPG_KEY_URL}" -o "${TMP_KEY}"

flatpak remote-add --if-not-exists beacn-on-linux --gpg-import="$TMP_KEY" "$FLATPAK_REPO_URL"
echo "Flatpak repository added. You can now install packages with flatpak."