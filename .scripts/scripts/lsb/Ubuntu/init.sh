#!/usr/bin/env bash

CHEZMOI_DIR=$HOME/.local/share/chezmoi
make -j -C $CHEZMOI_DIR/.scripts/scripts/lsb/$TARGET_LSB/ bootstrap
