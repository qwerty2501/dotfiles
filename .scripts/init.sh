#!/usr/bin/env bash

sudo apt update
sudo apt install -y build-essential
wd=$(chezmoi source-path)
make -j -C $wd/.scripts bootstrap
