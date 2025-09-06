#!/usr/bin/env bash
set -eu


case "$(uname -a)" in
  *Ubuntu* ) export TARGET_PLATFORM="Ubuntu" ;;
esac


CHEZMOI_DIR=$HOME/.local/share/chezmoi
"$CHEZMOI_DIR/.scripts/scripts/platform/$TARGET_PLATFORM/prepare.sh"
make -j -C $CHEZMOI_DIR/.scripts bootstrap
