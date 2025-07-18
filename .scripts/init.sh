#!/usr/bin/env bash

sudo apt update
sudo apt install -y build-essential
CHEZMOI_DIR=$HOME/.local/share/chezmoi
make -j -C $CHEZMOI_DIR/.scripts bootstrap
