#!/usr/bin/env bash
set -eu
CHEZMOI_DIR=$($HOME/bin/chezmoi source-path)
echo "chezmoi dir $$CHEZMOI_DIR"
$CHEZMOI_DIR/.scripts/init.sh
exit 0
