#!/usr/bin/env bash
set -eu


case "$(cat /etc/lsb-release)" in
  *Ubuntu* ) export TARGET_LSB="Ubuntu" ;;
  *cachyos* ) export TARGET_LSB="cachyos" ;;
esac


CHEZMOI_DIR=$HOME/.local/share/chezmoi
"$CHEZMOI_DIR/.scripts/scripts/platform/$TARGET_LSB/prepare.sh"
make -j -C $CHEZMOI_DIR/.scripts bootstrap
