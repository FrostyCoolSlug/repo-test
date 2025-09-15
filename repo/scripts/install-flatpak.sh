#!/bin/bash
set -e

USER="frostycoolslug"
REPOSITORY="repo-test"

GPG_KEY_URL="https://${USER}.github.io/${REPOSITORY}/public.gpg"
FLATPAK_REPO_URL="https://${USER}.github.io/${REPOSITORY}/flatpak"

flatpak remote-add --if-not-exists myrepo --gpg-import="$GPG_KEY_URL" "$FLATPAK_REPO_URL"
echo "Flatpak repository added. You can now install packages with flatpak."