#!/usr/bin/env bash

sudo apt update
sudo apt install -y build-essential
wd=$(dirname $0)
make -j -C $wd/.scripts bootstrap
