#!/usr/bin/env bash
set -eu

sudo pacman -R opendesktop-fonts || true
sudo ln -sfT dash /usr/bin/sh
chsh -s /usr/bin/bash

