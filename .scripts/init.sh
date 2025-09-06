#!/usr/bin/env bash
set -eu


if [ "$(uname -a | grep Ubuntu)" != "" ]; then
  export TARGET_PLATFORM="Ubuntu"
fi

CHEZMOI_DIR=$HOME/.local/share/chezmoi
"$CHEZMOI_DIR/.scripts/scripts/platform/$TARGET_PLATFORM/prepare.sh"
make -j -C $CHEZMOI_DIR/.scripts bootstrap
