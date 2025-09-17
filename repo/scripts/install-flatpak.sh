#!/bin/bash
set -e

USER="frostycoolslug"
REPOSITORY="repo-test"

FLATPAK_REF="https://${USER}.github.io/${REPOSITORY}/flatpak/beacn-utility.flatpakref"

echo "Installing Beacn Utility via Flatpak"
flatpak install ${FLATPAK_REF}

echo "Installation Complete"