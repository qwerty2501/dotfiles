#!/usr/bin/env bash
set -eu

sudo echo "start run onece init"
CHEZMOI_DIR=$HOME/.local/share/chezmoi
$CHEZMOI_DIR/.scripts/init.sh
exit 0
