#!/usr/bin/env bash

sudo apt update
sudo apt install -y build-essential
wd=$($HOME/bin/chezmoi source-path)
make -j -C $wd/.scripts bootstrap
